require_relative 'refuelable'
require_relative 'dineable'
require_relative 'simple_queue'

class CarStation
    attr_accessor :car_queue, :fuel_type, :restaurant_type, :refuelable, :dineable, :index
    def initialize(fuel_type, restaurant_type, index)
        @car_queue = SimpleQueue.new
        @fuel_type = fuel_type
        @restaurant_type = restaurant_type
        @refuelable = Refuelable.new(fuel_type)
        @dineable = Dineable.new(restaurant_type)
        @index = index
    end

    def add_car(car)
        @car_queue.enqueue(car)
    end

    def serve_cars
        until @car_queue.empty? do
            car = @car_queue.dequeue
            @refuelable.refuel(car)
            @dineable.serve_dinner(car) if car.is_dining
            puts(car)
        end
    end

    def queue_to_file(output_dir)
        FileUtils.mkdir_p(output_dir)

        Dir.foreach(output_dir) do |file|
            file_path = File.join(output_dir, file)
            File.delete(file_path) if File.file?(file_path)
        end

        # unless @car_queue.empty?
            @car_queue.elements.each_with_index do |car, index|
                file_name = "Car#{index + 1}.json"
                file_path = File.join(output_dir, file_name)
                File.open(file_path, 'w') do |file|
                    file.write(car.to_json)
                end
            end
        # end
    end

    # serve only next car from queue
    def serve_next_car
        unless @car_queue.empty?
            car = @car_queue.dequeue
            @refuelable.refuel(car)
            @dineable.serve_dinner(car) if car.is_dining
            puts(car)
        end
        queue_to_file("oop-car-service/queues/stations/station#{@index}")
    end
end