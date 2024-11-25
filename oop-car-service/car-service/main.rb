require 'fileutils'
require_relative 'lib/semaphore'
require_relative 'lib/car_station'
require_relative 'lib/file_scanner'

stations = [
  CarStation.new('GAS', 'PEOPLE', 1),
  CarStation.new('ELECTRIC', 'PEOPLE', 2),
  CarStation.new('GAS', 'ROBOTS', 3),
  CarStation.new('ELECTRIC', 'ROBOTS', 4),
]

queue_dir = 'oop-car-service/car-service/input/queue'
generator_dir = 'oop-car-service/car-service/input/generator.py'
scan_delay = 1.75

FileUtils.rm_rf(queue_dir) # clean generator input

thread = Thread.new do
    system("python #{generator_dir}")
end

semaphore = Semaphore.new(queue_dir, stations)
semaphore.set_car_serve_time(6)

# start file scanners
scaner1 = FileScanner.new('oop-car-service/queues/main_queue', 'oop-car-service/car-service/tests/logs', 'main_queue')
scaner2 = FileScanner.new('oop-car-service/queues/stations/station1', 'oop-car-service/car-service/tests/logs', 'station1')
scaner3 = FileScanner.new('oop-car-service/queues/stations/station2', 'oop-car-service/car-service/tests/logs', 'station2')
scaner4 = FileScanner.new('oop-car-service/queues/stations/station3', 'oop-car-service/car-service/tests/logs', 'station3')
scaner5 = FileScanner.new('oop-car-service/queues/stations/station4', 'oop-car-service/car-service/tests/logs', 'station4')

scaners = [scaner1, scaner2, scaner3, scaner4, scaner5]

scaners.each do |scaner|
    scaner.clear
end

# thread2 = Thread.new do
#     loop do
#         scaner1.log_files
#         sleep(scan_delay)
#         break if semaphore.stations_empty? and !thread.alive?
#     end
# end

loop do
    semaphore.get_cars
    semaphore.distribute_cars
    semaphore.serve_next_car

    # log queue states
    scaners.each do |scaner|
        scaner.log_files
    end

    break if semaphore.stations_empty? and !thread.alive?
    sleep(scan_delay)
end

semaphore.print_stats