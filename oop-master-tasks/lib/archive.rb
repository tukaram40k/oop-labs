class Archive
    attr_accessor :cars, :electric, :gas, :people, :robots, :dining, :not_dining, :consum_gas, :consum_electro
    def initialize
        @cars = 0
        @electric = 0
        @gas = 0
        @people = 0
        @robots = 0
        @dining = 0
        @not_dining = 0
        @consum_gas = 0
        @consum_electro = 0
    end

    def archive_info(car)
        @cars += 1
        if car.type == 'ELECTRIC'
            @electric += 1
            @consum_electro += car.consumption
        else
            @gas += 1
            @consum_gas += car.consumption
        end
        if car.passengers == 'PEOPLE'
            @people += 1
        else
            @robots += 1
        end

        if car.is_dining
            @dining += 1
        else
            @not_dining += 1
        end
    end

    def print_stats
        puts "cars: #{@cars}"
        puts "electric: #{@electric}"
        puts "gas: #{@gas}"
        puts "people: #{@people}"
        puts "robots: #{@robots}"
        puts "dining: #{@dining}"
        puts "not_dining: #{@not_dining}"
        puts "electric consumption: #{@consum_electro}"
        puts "gas consumption: #{@consum_gas}"
    end
end