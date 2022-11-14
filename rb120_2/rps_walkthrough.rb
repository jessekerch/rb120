# Move class for rock paper scissors choice
class Move
  VALUES = %w[rock paper scissors].freeze

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other)
    rock? && other.scissors? ||
      paper? && other.rock? ||
      scissors? && other.paper?
  end

  def <(other)
    rock? && other.paper? ||
      paper? && other.scissors? ||
      scissors? && other.rock?
  end

  def to_s
    @value
  end
end

# Player superclass
class Player
  attr_accessor :name
  def initialize
    set_name
    @score = 0
  end
end

# Human class subclass of Player
class Human < Player
  attr_accessor :move, :score

  def set_name
    username = ''
    loop do
      puts "What's your name?"
      username = gets.chomp
      break unless username.empty?
    end
    self.name = username
  end

  def choose
    choice = nil
    loop do
      puts 'Please choose rock, paper, or scissors:'
      choice = gets.chomp
      break if Move::VALUES.include?(choice)

      puts 'Sorry, invalid choice.'
    end
    self.move = Move.new(choice)
  end
    
  def award
    self.score += 1
  end
end

# Computer class as subclass for Player
class Computer < Player
  attr_accessor :move, :score

  def set_name
    self.name = %w[ロボット R2D2 C3PO Hal Number_5].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
  
  def award
    self.score += 1
  end
end

# Game orchestration engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts 'Welcome to the Rock, Paper, Scissors!'
  end

  def display_goodbye_message
    system 'clear'
    puts 'Thanks for playing Rock, Paper, Scissors!'
    puts "#{human.name} ended up with #{human.score} points and"
    puts "#{computer.name} with #{computer.score} points!"
    puts 'Goodbye!'
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end
  
  def award_winner
    if human.move > computer.move
      human.award
    elsif human.move < computer.move
      computer.award
    end
  end

  def display_score
    puts "#{human.name} has #{human.score} points!"
    puts "#{computer.name} has #{computer.score} points!"
  end
  
  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp
      break if %w[y n].include?(answer.downcase)

      puts 'Sorry, must be y or n.'
    end
    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      award_winner
      display_score
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
