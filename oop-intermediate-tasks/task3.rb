require_relative 'lib/display'
require_relative 'lib/assistant'

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