require 'fileutils'
require_relative '../lib/semaphore'
require_relative '../lib/car_station'

# test with generator.py

stations = [
  CarStation.new('GAS', 'PEOPLE'),
  CarStation.new('ELECTRIC', 'PEOPLE'),
  CarStation.new('GAS', 'ROBOTS'),
  CarStation.new('ELECTRIC', 'ROBOTS'),
]

queue_dir = 'oop-master-tasks/input/queue'
generator_dir = 'oop-master-tasks/input/generator.py'
scan_delay = 1.75

FileUtils.rm_rf(queue_dir) # clean generator input

thread = Thread.new do
    system("python #{generator_dir}")
end

semaphore = Semaphore.new(queue_dir, stations)
semaphore.set_car_serve_time(6)

loop do
    semaphore.get_cars
    semaphore.distribute_cars
    semaphore.serve_next_car
    break if semaphore.stations_empty? and !thread.alive?
    sleep(scan_delay)
end

semaphore.print_stats
