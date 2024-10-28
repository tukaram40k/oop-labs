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

m1 = Display.new(2560, 1600, 188.68, 'Legion Slim 5 16IRH8')
m2 = Display.new(1920, 1080, 102.70, 'ASUS VP229HF Eye Care Gaming Monitor')
m3 = Display.new(2560, 1440, 91.79, 'Samsung Odyssey G65B QHD 240Hz HDR600 Curved')

m1.compare_with_monitor(m2)
m1.compare_with_monitor(m3)
m2.compare_with_monitor(m3)