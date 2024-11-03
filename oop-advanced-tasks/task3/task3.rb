require_relative '../lib/coffee'
require_relative '../lib/cappuccino'
require_relative '../lib/americano'
require_relative '../lib/pumpkin_spice_latte'
require_relative '../lib/syrup_cappuccino'

b1 = Coffee.make_coffee('NORMAL')
b2 = Cappuccino.make_cappuccino('NORMAL', 20)
b3 = Americano.make_americano('STRONG', 20)
b4 = PumpkinSpiceLatte.make_pumpkin_spice_latte('LIGHT', 30, 15)
b5 = SyrupCappuccino.make_syrup_cappuccino("LIGHT", 45, 'VANILLA')
