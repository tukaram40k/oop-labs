class Assistant
    attr_accessor :assistant_name, :assigned_displays
    def initialize(n)
        @assistant_name = n
        @assigned_displays = []
    end

    def assign_display(display)
        @assigned_displays.push(display)
    end

    def assist
        puts("Assistant #{@assistant_name}'s advice:")
        (0..@assigned_displays.length - 1).each { |i|
            (i..@assigned_displays.length - 2).each { |j|
                @assigned_displays[i].compare_with_monitor(@assigned_displays[j+1])
            }
        }
    end

    def buy_display(display)
        @assigned_displays.delete(display)
        puts("Bought monitor #{display.model}.")
    end
end