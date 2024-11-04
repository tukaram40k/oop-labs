require_relative 'lib/barista.rb'

barista = Barista.new

orders = [
    %w[Coffee NORMAL],
    %w[Cappuccino STRONG 50],
    %w[Americano LIGHT 30],
    %w[PumpkinSpiceLatte LIGHT 50 20],
    %w[SyrupCappuccino STRONG 60 VANILLA]
]

barista.take_orders(orders)