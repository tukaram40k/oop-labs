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
end