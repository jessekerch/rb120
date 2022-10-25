class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    @color = color
    super
  end
end

bear = Bear.new("black")        # => #<Bear:0x007fb40b1e6718 @color="black">