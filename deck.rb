require "./card"

class Deck
  FACE_VALUES = (2..10).to_a + ["A", "K", "Q", "J"]
  SUIT_VALUES = ["Diamonds", "Hearts", "Spades", "Clubs"]

  attr_accessor :deck_cards

  def initialize
    @deck_cards = []
      FACE_VALUES.each do |value|
      SUIT_VALUES.each do |suit|
        deck_cards << Card.new(value, suit)
      end
    end
  end

  def shuffle_deck
    deck_cards.shuffle!
  end

  def deal_card!
    deck_cards.shift
  end

end
