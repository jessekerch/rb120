class Person
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    parse_full_name(full_name)
  end
  
  def name
    "#{first_name} #{last_name}".strip
  end
  
  def name=(full_name)
    parse_full_name(full_name)
  end
  
  def parse_full_name(full_name)
    names = full_name.split
    self.first_name = names.first
    self.last_name = names.size > 1 ? names.last : ""
  end
  
  def to_s
    name
  end
end
  
bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
