class Coffee
    attr_accessor :name, :coffee_intensity
    def initialize(coffee_intensity)
        @name = 'Coffee'
        @coffee_intensity = coffee_intensity
    end
end

class Cappuccino < Coffee
    attr_accessor :ml_of_milk
    def initialize(coffee_intensity, ml_of_milk)
        super(coffee_intensity)
        @name = 'Cappuccino'
        @ml_of_milk = ml_of_milk
    end
end

class Americano < Coffee
    attr_accessor :ml_of_water
    def initialize(coffee_intensity, ml_of_water)
        super(coffee_intensity)
        @name = 'Americano'
        @ml_of_water = ml_of_water
    end
end

class PumpkinSpiceLatte < Cappuccino
    attr_accessor :mg_of_pumpkin_spice
    def initialize(coffee_intensity, ml_of_milk, mg_of_pumpkin_spice)
        super(coffee_intensity, ml_of_milk)
        @name = 'PumpkinSpiceLatte'
        @mg_of_pumpkin_spice = mg_of_pumpkin_spice
    end
end

class SyrupCappuccino < Cappuccino
    attr_accessor :syrup_type
    def initialize(coffee_intensity, ml_of_milk, syrup_type)
        super(coffee_intensity, ml_of_milk)
        @name = 'SyrupCappuccino'
        @syrup_type = syrup_type
    end
end