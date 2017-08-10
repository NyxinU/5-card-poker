require_relative "card.rb"

class Deck
  attr_reader :cards
SUITS = [:D,:C,:H,:S]

  def initialize(cards)
    @cards = cards
    @cards.shuffle!
  end

  def self.populate_deck
    cards = []
    (2..14).each do |value|
      SUITS.each do |suit|
        cards << Card.new(value,suit)
      end
    end
    Deck.new(cards)
  end

  def deal_cards(amount)
    dealt = []
    amount.times do |i|
      dealt = @cards.pop
    end
    dealt
  end



end

if __FILE__ == $PROGRAM_NAME
  d = Deck.populate_deck
  p d
end
