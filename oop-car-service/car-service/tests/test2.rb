require_relative '../lib/car_station'

# test car station logic

st1 = CarStation.new('electro', 'humans')
st1.add_car('1')
st1.add_car('2')
st1.add_car('3')
st1.serve_cars
puts ' '

st2 = CarStation.new('gas', 'robots')
st2.add_car('4')
st2.add_car('5')
st2.serve_cars
puts ' '
st2.add_car('6')
st2.serve_cars
