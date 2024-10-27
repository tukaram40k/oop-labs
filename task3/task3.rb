class Display
    attr_accessor :width, :height, :ppi, :model
    def initialize(w, h, p, m)
        @width = w
        @height = h
        @ppi = p
        @model = m
    end

    def compare_size(m)
        if @width * @height > m.width * m.height
            winner = @model
        else
            winner = m.model
        end
        puts("Comparing size of \"" + @model + "\" with \"" + m.model + "\".")
        puts("The \"" + winner + "\" monitor is bigger.")
    end

    def compare_sharpness(m)
        if @width * @height * @ppi > m.width * m.height * m.ppi
            winner = @model
        else
            winner = m.model
        end
        puts("Comparing sharpness of \"" + @model + "\" with \"" + m.model + "\".")
        puts("The \"" + winner + "\" monitor is sharper.")
    end

    def compare_with_monitor(m)
        compare_size(m)
        compare_sharpness(m)
        puts(" ")
    end
end

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

a1 = Assistant.new('Ion')

m1 = Display.new(2560, 1600, 188.68, 'Legion Slim 5 16IRH8')
m2 = Display.new(1920, 1080, 102.70, 'ASUS VP229HF Eye Care Gaming Monitor')
m3 = Display.new(2560, 1440, 91.79, 'Samsung Odyssey G65B QHD 240Hz HDR600 Curved')

displays = [m1, m2, m3]
displays.each do |display|
    a1.assign_display(display)
end

a1.assist
a1.buy_display(m2)