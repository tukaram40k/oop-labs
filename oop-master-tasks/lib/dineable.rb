class Dineable
    attr_accessor :user_type
    def initialize(user_type)
        @user_type = user_type
    end
    def serve_dinner(car_id)
        puts("Serving dinner to #{@user_type} in car #{car_id}.")
    end
end