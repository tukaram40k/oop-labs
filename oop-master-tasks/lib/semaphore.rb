require 'json'
require_relative 'car'
require_relative 'car_station'
require_relative 'simple_queue'
require_relative 'archive'

class Semaphore
    attr_accessor :dir, :queue, :stations, :archive
    def initialize(dir, stations)
        @dir = dir
        @queue = SimpleQueue.new
        @stations = stations
        @archive = Archive.new
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
            # check for duplicates
            unless @queue.elements.include?(car)
                @queue.enqueue(car)
            end
        end
    end

    def distribute_cars
        until @queue.empty? do
            car = @queue.dequeue
            @archive.archive_info(car)

            @stations.each do |station|
                if station.fuel_type == car.type and (station.restaurant_type == car.passengers or car.is_dining == 'false')
                    station.add_car(car)
                end
            end
        end
    end
end