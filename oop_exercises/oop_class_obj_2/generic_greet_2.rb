class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def self.generic_greeting
    puts "Hi, I'm a Cat."
  end
  
  def personal_greeting
    puts "Hi, I'm #{name}."
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting
