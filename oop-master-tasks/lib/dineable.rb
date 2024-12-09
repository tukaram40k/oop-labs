class Dineable
    attr_accessor :user_type
    def initialize(user_type)
        @user_type = user_type
    end
    def serve_dinner(car)
        puts("Serving dinner to #{car.passengers} in car #{car.id}.")
    end
end