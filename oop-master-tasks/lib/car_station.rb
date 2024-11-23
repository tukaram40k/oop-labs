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
        @car_queue.elements.each do |car|
            @refuelable.refuel(car)
            @dineable.serve_dinner(car)
            @car_queue.dequeue
        end
    end
end