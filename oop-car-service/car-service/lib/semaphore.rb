require 'json'
require 'fileutils'
require_relative 'car'
require_relative 'car_station'
require_relative 'simple_queue'
require_relative 'archive'

class Semaphore
    attr_accessor :dir, :queue, :stations, :archive, :processed_cars, :unprocessed_cars, :car_serve_time
    def initialize(dir, stations)
        @dir = dir
        @queue = SimpleQueue.new
        @stations = stations
        @archive = Archive.new
        @processed_cars = [] # workaround to prevent dupes
        @unprocessed_cars = 0
        @car_serve_time = 2
        @log_status = false
    end

    def queue_to_file(output_dir)
        FileUtils.mkdir_p(output_dir)

        Dir.foreach(output_dir) do |file|
            file_path = File.join(output_dir, file)
            File.delete(file_path) if File.file?(file_path)
        end

        @queue.elements.each_with_index do |car, index|
            file_name = "Car#{index + 1}.json"
            file_path = File.join(output_dir, file_name)
            File.open(file_path, 'w') do |file|
                file.write(car.to_json)
            end
        end
    end

    def get_cars
        jsons = Dir["#{@dir}/*.json"]
        jsons.each do |json_file|
            json_contents = File.read(json_file)
            car_data = JSON.parse(json_contents)
            car = Car.new(
              id: car_data['id'],
              type: car_data['type'],
              passengers: car_data['passengers'],
              is_dining: car_data['isDining'],
              consumption: car_data['consumption']
            )
            # check for dupes
            # unless @processed_cars.include?(car.id)
            #     @processed_cars << car.id
            #     @queue.enqueue(car)
            # end

            # check properly for dupes
            duplicate = false
            @processed_cars.each do |car_obj|
                duplicate = true if car_obj.id == car.id
            end
            unless duplicate
                @processed_cars << car
                @queue.enqueue(car)
            end
        end

        queue_to_file('oop-car-service/queues/main_queue')
    end

    def distribute_cars
        until @queue.empty? do
            car = @queue.dequeue

            # station queue balancing
            possible_stations = []
            @stations.each do |station|
                if station.fuel_type == car.type and (station.restaurant_type == car.passengers or !car.is_dining)
                    possible_stations << station
                end
            end

            if possible_stations.empty?
                puts "car #{car.id} could not be served"
                @unprocessed_cars += 1
            else
                sorted_stations = possible_stations.sort_by {|station| station.car_queue.size}
                sorted_stations[0].add_car(car)
                @archive.archive_info(car)
            end

            # processed = false
            # @stations.each do |station|
            #     if station.fuel_type == car.type and (station.restaurant_type == car.passengers or !car.is_dining)
            #         station.add_car(car)
            #         @archive.archive_info(car)
            #         processed = true
            #         break
            #     end
            # end
            # unless processed
            #     puts "car #{car.id} could not be served"
            #     @unprocessed_cars += 1
            # end
        end
    end

    def serve_cars
        @stations.each_with_index do |station, index|
            puts "Station #{index+1} (#{station.fuel_type}, #{station.restaurant_type})"
            station.serve_cars
            puts ''
        end
        sleep(@car_serve_time)
    end

    def serve_next_car
        @stations.each_with_index do |station, index|
            puts "Station #{index+1} (#{station.fuel_type}, #{station.restaurant_type})"
            station.serve_next_car
            puts ''
        end
        sleep(@car_serve_time)
    end

    def stations_empty?
        @stations.each do |station|
            return false unless station.car_queue.empty?
        end
        true
    end

    def print_stats
        actual_stats = Archive.new
        @processed_cars.each do |car|
            actual_stats.archive_info(car)
        end
        puts 'Semaphore stats:'
        actual_stats.print_stats
        puts "could not serve #{@unprocessed_cars} cars." if @unprocessed_cars > 0

        puts ''
        puts 'Stations stats:'
        @archive.print_stats
    end

    def set_car_serve_time(sec)
        @car_serve_time = sec
    end
end