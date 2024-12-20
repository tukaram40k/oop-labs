require_relative 'cappuccino'

class Barista
    class PumpkinSpiceLatte < Cappuccino
        attr_accessor :mg_of_pumpkin_spice
        def initialize(coffee_intensity, ml_of_milk, mg_of_pumpkin_spice)
            super(coffee_intensity, ml_of_milk)
            @name = 'PumpkinSpiceLatte'
            @mg_of_pumpkin_spice = mg_of_pumpkin_spice
        end

        def print_details
            super
            puts("mg of pumpkin spice: #{@mg_of_pumpkin_spice}")
        end

        def self.make_pumpkin_spice_latte(coffee_intensity, ml_of_milk, mg_of_pumpkin_spice)
            beverage = self.new(coffee_intensity, ml_of_milk, mg_of_pumpkin_spice)
            beverage.make_beverage
            beverage
        end
    end
end