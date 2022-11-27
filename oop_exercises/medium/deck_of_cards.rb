class Card
  include Comparable
  attr_reader :rank, :suit
  
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  
  def to_s
    "#{@rank} of #{@suit}"
  end
  
  def card_value(card_rank)
    case card_rank
    when 2..10 then card_rank
    when 'Jack' then 11
    when 'Queen' then 12
    when 'King' then 13
    when 'Ace' then 14
    end
  end
  
  def <=>(other_card)
    card_value(@rank) <=> card_value(other_card.rank)
  end
  
  def ==(other_card)
    @rank == other_card.rank && @suit == other_card.suit
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  def initialize
    make_deck
  end
  
  def make_deck
    @cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.shuffle!
  end
  
  def draw
    make_deck if @cards.empty?
    @cards.pop
  end
end

deck = Deck.new
drawn = []
drawn << deck.draw
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.

