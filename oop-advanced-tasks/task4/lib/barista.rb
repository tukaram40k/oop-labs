require_relative 'barista/coffee'
require_relative 'barista/cappuccino'
require_relative 'barista/americano'
require_relative 'barista/pumpkin_spice_latte'
require_relative 'barista/syrup_cappuccino'

class Barista
    def make_coffee(coffee_intensity)
        Coffee.make_coffee(coffee_intensity)
    end

    def make_cappuccino(coffee_intensity, ml_of_milk)
        Cappuccino.make_cappuccino(coffee_intensity, ml_of_milk)
    end

    def make_americano(coffee_intensity, ml_of_water)
        Americano.make_americano(coffee_intensity, ml_of_water)
    end

    def make_pumpkin_spice_latte(coffee_intensity, ml_of_milk, mg_of_pumpkin_spice)
        PumpkinSpiceLatte.make_pumpkin_spice_latte(coffee_intensity, ml_of_milk, mg_of_pumpkin_spice)
    end

    def make_syrup_cappuccino(coffee_intensity, ml_of_milk, syrup_type)
        SyrupCappuccino.make_syrup_cappuccino(coffee_intensity, ml_of_milk, syrup_type)
    end

    def take_orders(orders)
        orders.each do |order|
            case order[0]
            when "Coffee" then
                beverage = make_coffee(order[1])
                beverage.print_details
            when "Cappuccino" then
                beverage = make_cappuccino(order[1], order[2])
                beverage.print_details
            when "Americano" then
                beverage = make_americano(order[1], order[2])
                beverage.print_details
            when "PumpkinSpiceLatte" then
                beverage = make_pumpkin_spice_latte(order[1], order[2], order[3])
                beverage.print_details
            when "SyrupCappuccino" then
                beverage = make_syrup_cappuccino(order[1], order[2], order[3])
                beverage.print_details
            else puts("That's not a coffee type!")
            end
            puts("")
        end
    end
end