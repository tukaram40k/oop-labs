require 'fileutils'
require 'thread'
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
scan_delay = 1

FileUtils.rm_rf(queue_dir) # clean generator input

# start the generator
generator_thread = Thread.new do
    system("python #{generator_dir}")
end

semaphore = Semaphore.new(queue_dir, stations)
semaphore.set_car_serve_time(6)

# start file scanners
scanners = [
  FileScanner.new('oop-car-service/queues/main_queue', 'oop-car-service/car-service/tests/logs', 'main_queue'),
  FileScanner.new('oop-car-service/queues/stations/station1', 'oop-car-service/car-service/tests/logs', 'station1'),
  FileScanner.new('oop-car-service/queues/stations/station2', 'oop-car-service/car-service/tests/logs', 'station2'),
  FileScanner.new('oop-car-service/queues/stations/station3', 'oop-car-service/car-service/tests/logs', 'station3'),
  FileScanner.new('oop-car-service/queues/stations/station4', 'oop-car-service/car-service/tests/logs', 'station4'),
]

# Clear all scanner logs
scanners.each(&:clear)

threads = []

# for fetching cars
threads << Thread.new do
    loop do
        semaphore.get_cars
        semaphore.distribute_cars
        break if semaphore.stations_empty? && !generator_thread.alive?
        sleep(scan_delay)
    end
end

# for serving next car
threads << Thread.new do
    loop do
        semaphore.serve_next_car
        break if semaphore.stations_empty? && !generator_thread.alive?
    end
end

# for logging queue states
threads << Thread.new do
    loop do
        scanners.each(&:log_files)
        break if semaphore.stations_empty? && !generator_thread.alive?
        sleep(1)
    end
end

threads.each(&:join)
semaphore.print_stats
