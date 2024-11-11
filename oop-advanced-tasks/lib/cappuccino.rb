require_relative 'coffee'

class Cappuccino < Coffee
    attr_accessor :ml_of_milk
    def initialize(coffee_intensity, ml_of_milk)
        super(coffee_intensity)
        @name = 'Cappuccino'
        @ml_of_milk = ml_of_milk
    end

    def print_details
        super
        puts("ml of milk: #{@ml_of_milk}")
    end

    def self.make_cappuccino(coffee_intensity, ml_of_milk)
        beverage = self.new(coffee_intensity, ml_of_milk)
        beverage.make_beverage
        beverage
    end
end