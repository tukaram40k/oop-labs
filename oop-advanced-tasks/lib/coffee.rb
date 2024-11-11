class Coffee
    attr_accessor :name, :coffee_intensity # maybe not accessor ?
    def initialize(coffee_intensity)
        @name = 'Coffee'
        @coffee_intensity = coffee_intensity
    end

    def print_details
        puts("Name: #{@name}")
        puts("Intensity: #{@coffee_intensity}")
    end

    def self.make_coffee(coffee_intensity)
        beverage = self.new(coffee_intensity)
        beverage.make_beverage
        beverage
    end

    def make_beverage
        puts("Making #{@name}...")
        puts("Intensity set to #{@coffee_intensity}.")
        puts("Adding #{@ml_of_milk} ml of milk...") unless (self.instance_of?(Coffee) or self.instance_of?(Americano))
        puts("Adding #{@ml_of_water} ml of water...") if self.instance_of?(Americano)
        puts("Adding #{@mg_of_pumpkin_spice} mg of pumpkin spice...") if self.instance_of?(PumpkinSpiceLatte)
        puts("Adding #{@syrup_type} syrup...") if self.instance_of?(SyrupCappuccino)
        puts("Done!")
        puts("")
    end
end