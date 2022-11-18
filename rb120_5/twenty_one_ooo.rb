class Participant
  VALUES = { "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9,
          "10" => 10, "J" => 10, "Q" => 10, "K" => 10, "A" => 11 }
  
  attr_reader :name, :total, :hand

  def initialize(name)
    @name = name
    @hand = []
  end

  def hit(card)
    # add a card from the deck to this participants hand
    @hand << card
  end
  
  def show_cards
    puts "#{name} has #{@hand}"
  end
  
  def busted?
    # return true if hand total is > 22
    total > 21
  end

  def total
    # return total value of hand
    total = 0
    @hand.each do |card|
      total += VALUES[card[0..-2]]
    end
    total
  end
  
  def hit_or_stay
    answer = ''
    loop do
      puts "Would you like to hit or stay?"
      answer = gets.chomp
      break if %w[hit stay].include?(answer)
      puts "Sorry that's not a valid choice."
    end
    answer
  end
end

class Deck
  attr_reader :cards
  
  def initialize
    @cards = []
    build_deck
    shuffle_deck
  end

  def build_deck
    suits = ["♥", "♦", "♣", "♠"]
    ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
    suits.each do |suit|
      ranks.each { |rank| @cards << "#{rank}#{suit}" }
    end
  end
  
  def shuffle_deck
    @cards.shuffle!
  end
  
  def deal_out
    card = cards.sample
    cards.delete(card)
  end
end

class Game
  
  attr_reader :player, :dealer, :deck
  
  def initialize
    @player = Participant.new("Player")
    @dealer = Participant.new("Dealer")
    @deck = Deck.new
  end

  def start
    deal_cards
    player.show_cards
    dealer.show_cards
    main_game
  end
  
  def main_game
    player_turn
    dealer_turn
    show_result
  end

  def show_result
    system 'clear'
    player.show_cards
    dealer.show_cards
    case
    when player.busted?
      puts "#{player.name} busted! Dealer wins!"
    when dealer.busted?
      puts "Dealer busted! #{player.name} wins!"
    when player.total > dealer.total
      puts "#{player.name} wins!"
    when player.total < dealer.total
      puts "Dealer wins!"
    end
  end
  
  def deal_cards
    # deal cards to both players, i.e. hit both players twice
    player.hit(deck.deal_out)
    dealer.hit(deck.deal_out)
    player.hit(deck.deal_out)
    dealer.hit(deck.deal_out)
  end
  
  def player_turn
    loop do
      case player.hit_or_stay
      when 'hit'
        player.hit(deck.deal_out)
        puts "#{player.name} hits!"
        player.show_cards
      when 'stay'
        break
      end
      break if player.busted?
    end
  end
  
  def dealer_turn
    while dealer.total < 16
      break if dealer.busted?
      dealer.hit(deck.deal_out)
      puts "#{dealer.name} hits!"
    end
  end
end

Game.new.start