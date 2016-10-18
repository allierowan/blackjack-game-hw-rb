module StandardPlayingCards
  class Deck

    attr_accessor :deck_cards
 
    def initialize(input_cards = [])
      if input_cards.length > 0
        @deck_cards = input_cards
      else
        @deck_cards = []
        FACE_VALUES.each do |value|
          SUIT_VALUES.each do |suit|
            deck_cards << Card.new(value, suit)
          end
        end
      end
    end

    def shuffle_deck!
      raise DeckEmptyError if deck_cards.size ==0
      deck_cards.shuffle!
    end

    def deal_card!
      raise DeckEmptyError if deck_cards.size ==0
      deck_cards.shift
    end

    def empty?
      deck_cards == []
    end

  end
end
