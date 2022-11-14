class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end

end

class Owner
  attr_reader :name, :number_of_pets
  attr_writer :number_of_pets
  
  def initialize(name)
    @name = name
    @number_of_pets = 0
  end
end

class Shelter
  def initialize
    @pet_list = {}
  end
  
  def adopt(person, pet)
    person.number_of_pets += 1
    
    if @pet_list[person.name]
      @pet_list[person.name] << [pet.type, pet.name]
    else
      @pet_list[person.name] = [[pet.type, pet.name]]
    end
  end
  
  def print_adoptions
    @pet_list.each do |person, animal|
      puts "#{person} has adopted the following pets:"
      animal.each do |pet|
        puts "a #{pet[0]} named #{pet[1]}"
      end
    end
  end
    
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."