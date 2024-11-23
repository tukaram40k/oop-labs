class Refuelable
    attr_accessor :type
    def initialize(type)
        @type = type
    end
    def refuel (car_id)
        puts("Refueling #{@type} car #{car_id}.")
    end
end