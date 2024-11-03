require_relative '../lib/coffee'
require_relative '../lib/cappuccino'
require_relative '../lib/americano'
require_relative '../lib/pumpkin_spice_latte'
require_relative '../lib/syrup_cappuccino'

b1 = Coffee.new('NORMAL')
b2 = Cappuccino.new('NORMAL', 20)
b3 = Americano.new('STRONG', 20, 30)
b4 = PumpkinSpiceLatte.new('LIGHT', 30, 15)
b5 = SyrupCappuccino.new("LIGHT", 45, 'VANILLA')

beverages = [b1, b2, b3, b4, b5]

beverages.each_with_index do |beverage, i|
    puts("Beverage #{i+1}:")
    beverage.print_details
    puts(' ')
end