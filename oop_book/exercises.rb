class Students

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_person)
    grade > other_person.grade
  end
  
  protected
  
  def grade
    @grade
  end
end

joe = Students.new("Joe", 96)
bob = Students.new("Bob", 89)

puts "Well done!" if joe.better_grade_than?(bob)
puts joe.grade

# module Towable
#   def tow_capacity
#     "Yes this vehicle is equipped to tow."
#   end
# end

# class Vehicle
#   attr_accessor :color, :year, :model
  
#   @@number_of_vehicles = 0

#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @speed = 0
#     @@number_of_vehicles += 1
#   end
  
#   def self.total_number_of_vehicles
#     "You have a total of #{@@number_of_vehicles} vehicles."
#   end
  
#   def self.gas_mileage(gallons, miles)
#     puts "Your gas mileage is #{miles/gallons} miles per gallon."
#   end

#   def info
#     "#{year} is the year, #{color} is the color."
#   end
  
#   def spray_paint(new_color)
#     self.color = new_color
#     puts "You just painted your vehicle #{new_color}. Cool!"
#   end
  
#   def age
#     "Your #{self.model} is #{years_old} years old."
#   end

#   private

#   def years_old
#     Time.now.year.to_i - self.year.to_i
#   end
# end
  
# class MyCar < Vehicle
#   attr_accessor :seats
#   NO_OF_DOORS = 2

#   def to_s
#     "My car is a #{color} #{year} #{model}."
#   end
# end

# class MyTruck < Vehicle
#   include Towable
#   NO_OF_DOORS = 2
  
#   def to_s
#     "My truck is a #{color} #{year} #{model}."
#   end
# end  

# mycar = MyCar.new(2015, "grey", "Toyota Sienna")
# puts mycar
# puts mycar.age


