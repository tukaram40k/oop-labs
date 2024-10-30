require_relative 'lib/display'

m1 = Display.new(2560, 1600, 188.68, 'Legion Slim 5 16IRH8')
m2 = Display.new(1920, 1080, 102.70, 'ASUS VP229HF Eye Care Gaming Monitor')
m3 = Display.new(2560, 1440, 91.79, 'Samsung Odyssey G65B QHD 240Hz HDR600 Curved')

m1.compare_with_monitor(m2)
m1.compare_with_monitor(m3)
m2.compare_with_monitor(m3)