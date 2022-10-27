module Transportation
  class Vehicle
  end
  
  class Truck < Vehicle
    def initialize
      puts "Made a new truck!"
    end
  end
  
  class Car < Vehicle
  end
end

mytruck = Transportation::Truck.new
puts mytruck