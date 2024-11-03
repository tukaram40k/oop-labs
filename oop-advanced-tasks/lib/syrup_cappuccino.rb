require_relative 'cappuccino'

class SyrupCappuccino < Cappuccino
    attr_accessor :syrup_type
    def initialize(coffee_intensity, ml_of_milk, syrup_type)
        super(coffee_intensity, ml_of_milk)
        @name = 'SyrupCappuccino'
        @syrup_type = syrup_type
    end

    def print_details
        super
        puts("Syrup type: #{@syrup_type}")
    end
end