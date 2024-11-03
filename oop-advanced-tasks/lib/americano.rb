require_relative 'cappuccino'

class Americano < Cappuccino
    attr_accessor :ml_of_water
    def initialize(coffee_intensity, ml_of_milk, ml_of_water)
        super(coffee_intensity, ml_of_milk)
        @name = 'Americano'
        @ml_of_water = ml_of_water
    end

    def print_details
        super
        puts("ml of water: #{@ml_of_water}")
    end
end