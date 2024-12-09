class Refuelable
    attr_accessor :type
    def initialize(type)
        @type = type
    end
    def refuel (car)
        puts("Refueling #{car.type} car #{car.id}.")
    end
end