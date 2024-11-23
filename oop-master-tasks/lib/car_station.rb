require_relative 'refuelable'
require_relative 'dineable'
require_relative 'simple_queue'

class CarStation
    attr_accessor :car_queue, :refuelable, :dineable
    def initialize(refuelable, dineable)
        @car_queue = SimpleQueue.new
        @refuelable = Refuelable.new(refuelable) # TODO: test this crap
        @dineable = Dineable.new(dineable)
    end

    def add_car(car)
        @car_queue.enqueue(car)
    end

    def serve_cars # TODO: test this crap as well
        until @car_queue.empty? do
            car = @car_queue.dequeue
            @refuelable.refuel(car)
            @dineable.serve_dinner(car)
        end
    end
end