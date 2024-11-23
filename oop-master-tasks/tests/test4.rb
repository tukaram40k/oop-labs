require_relative '../lib/semaphore'
require_relative '../lib/car_station'

# test main logic

stations = [
  CarStation.new('GAS', 'PEOPLE'),
  CarStation.new('ELECTRIC', 'ROBOTS'),
  CarStation.new('GAS', 'PEOPLE'),
  CarStation.new('ELECTRIC', 'ROBOTS'),
]

dir = File.join(File.dirname(__FILE__), 'test-queue')

semaphore = Semaphore.new(dir, stations)
semaphore.get_cars
semaphore.distribute_cars
semaphore.serve_cars
semaphore.print_stats
