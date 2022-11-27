
class GuessingGame
  def initialize(low_num, high_num)
    @range = low_num..high_num
    @max_guesses = Math.log2(@range.to_a.size).to_i + 1
    @target_number = rand(@range)
    @guess_count = 0
  end

  def play
    loop do
      guesses_remaining_message
      get_player_guess
      guess_response
      break if correct_guess?
      break if no_more_guesses?
    end
    win_or_lose_message
    # play_again?
  end
  
  def win_or_lose_message
    if correct_guess?
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end
  
  def guesses_remaining_message
    puts "You have #{@max_guesses - @guess_count} guesses remaining."
  end
  
  def get_player_guess
    loop do
      puts "Enter a number between #{@range.first} and #{@range.last}: "
      @player_guess = gets.chomp.to_i
      break if @range.include?(@player_guess)
      puts "That's not a valid number."
    end
  end
  
  def guess_response
    @guess_count += 1
    if correct_guess?
      puts "That's the number!"
      puts ""
    else
      puts "Your guess is too #{high_or_low}."
      puts ""
    end
  end
  
  def high_or_low
    @target_number > @player_guess ? "low" : "high"
  end
  
  def correct_guess?
    @player_guess == @target_number
  end
  
  def no_more_guesses?
    @guess_count == @max_guesses
  end
end

game = GuessingGame.new(501, 1500)
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guess remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!
