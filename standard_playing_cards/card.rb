module StandardPlayingCards
  class Card

    CARD_SCORES = {"A"=> 11, "K"=> 10, "Q"=> 10, "J"=> 10}
    
    attr_reader :face_value, :suit

    def initialize(face_value, suit)
      raise InvalidCardInputError unless FACE_VALUES.include?(face_value) && SUIT_VALUES.include?(suit)
      @face_value = face_value
      @suit = suit
    end

    def points
      if CARD_SCORES[face_value]
        CARD_SCORES[face_value]
      else
        face_value
      end
    end

    def ==(other_card)
      face_value == other_card.face_value && suit == other_card.suit
    end

  end
end
