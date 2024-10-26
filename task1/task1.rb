class Display
    attr_accessor :width, :height, :ppi, :model
    def initialize(w, h, p, m)
        @width = w
        @height = h
        @ppi = p
        @model = m
    end
end

def compare_size(m1, m2)
    if m1.width * m1.height > m2.width * m2.height
        winner = m1.model
    else
        winner = m2.model
    end
    puts("Comparing size of \"" + m1.model + "\" with \"" + m2.model + "\".")
    puts("The \"" + winner + "\" monitor is bigger.")
end

def compare_sharpness(m1, m2)
    if m1.width * m1.height * m1.ppi > m2.width * m2.height * m2.ppi
        winner = m1.model
    else
        winner = m2.model
    end
    puts("Comparing sharpness of \"" + m1.model + "\" with \"" + m2.model + "\".")
    puts("The \"" + winner + "\" monitor is sharper.")
end

def compare_with_monitor(m1, m2)
    compare_size(m1, m2)
    compare_sharpness(m1, m2)
    puts(" ")
end

m1 = Display.new(2560, 1600, 188.68, 'Legion Slim 5 16IRH8')
m2 = Display.new(1920, 1080, 102.70, 'ASUS VP229HF Eye Care Gaming Monitor')
m3 = Display.new(2560, 1440, 91.79, 'Samsung Odyssey G65B QHD 240Hz HDR600 Curved')

compare_with_monitor(m1, m2)
compare_with_monitor(m1, m3)
compare_with_monitor(m2, m3)