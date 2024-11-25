class Car
    attr_accessor :id, :type, :passengers, :is_dining, :consumption
    def initialize(id:, type:, passengers:, is_dining:, consumption:)
        @id = id
        @type = type
        @passengers = passengers
        @is_dining = is_dining
        @consumption = consumption
    end

    def to_s
        "id: #{@id}, type: #{@type}, passengers: #{@passengers}, isDining: #{@is_dining}, consumption: #{@consumption}"
    end

    def to_json
        "{\"id\": #{@id}, \"type\": \"#{@type}\", \"passengers\": \"#{@passengers}\", \"isDining\": #{@is_dining}, \"consumption\": #{@consumption}}"
    end
end