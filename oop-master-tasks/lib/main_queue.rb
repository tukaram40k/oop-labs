require_relative 'simple_queue'

class MainQueue < SimpleQueue
    attr_accessor :elements
    def initialize
        super
    end

    def scan_for_cars
        # read queue folder contents
        sleep(1.75)
    end
end