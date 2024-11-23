require_relative '../lib/car_station'

st1 = CarStation.new('electro', 'humans')
st1.add_car('1')
st1.add_car('2')
st1.add_car('3')
st1.serve_cars
puts ' '
st2 = CarStation.new('gas', 'robots')
st2.add_car('1')
st2.add_car('2')
st2.serve_cars
puts ' '
st2.add_car('3')
st2.serve_cars

# TODO: fix array parsing