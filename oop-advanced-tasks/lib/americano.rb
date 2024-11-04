require_relative 'coffee'

class Americano < Coffee
    attr_accessor :ml_of_water
    def initialize(coffee_intensity, ml_of_water)
        super(coffee_intensity)
        @name = 'Americano'
        @ml_of_water = ml_of_water
    end

    def print_details
        super
        puts("ml of water: #{@ml_of_water}")
    end

    def self.make_americano(coffee_intensity, ml_of_water)
        beverage = self.new(coffee_intensity, ml_of_water)
        beverage.make_beverage
        beverage
    end
end