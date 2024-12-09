require_relative 'refuelable'
require_relative 'dineable'
require_relative 'simple_queue'

class CarStation
    attr_accessor :car_queue, :fuel_type, :restaurant_type, :refuelable, :dineable
    def initialize(fuel_type, restaurant_type)
        @car_queue = SimpleQueue.new
        @fuel_type = fuel_type
        @restaurant_type = restaurant_type
        @refuelable = Refuelable.new(fuel_type)
        @dineable = Dineable.new(restaurant_type)
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

    # serve only next car from queue
    def serve_next_car
        unless @car_queue.empty?
            car = @car_queue.dequeue
            @refuelable.refuel(car)
            @dineable.serve_dinner(car) if car.is_dining
            puts(car)
        end
    end
end