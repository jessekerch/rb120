class Person
  def initialize(n)
    @name = n
  end
  
  def name
    @name.clone
  end
  
end

person1 = Person.new('James')
puts person1.name.reverse!
puts person1.name