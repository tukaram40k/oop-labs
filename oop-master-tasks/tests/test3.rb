require 'json'
require_relative '../lib/car_station'
require_relative '../lib/main_queue'
require_relative '../lib/car'

# test json parsing

def get_cars(dir)
    cars = []
    jsons = Dir["#{dir}/*.json"]
    jsons.each do |json_file|
        json_contents = File.read(json_file)
        car_data = JSON.parse(json_contents)
        car = Car.new(
          id: car_data['id'],
          type: car_data['type'],
          passengers: car_data['passengers'],
          is_dining: car_data['isDining'],
          consumption: car_data['consumption']
        )
        cars << car
    end
    cars
end

# up one folder
# cars = get_cars(File.join(File.dirname(__FILE__), '..', 'test-queue'))

cars = get_cars(File.join(File.dirname(__FILE__), 'test-queue'))
puts cars
