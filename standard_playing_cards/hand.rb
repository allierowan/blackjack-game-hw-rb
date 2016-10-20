module StandardPlayingCards
  class Hand
    attr_accessor :cards_in_hand

    def initialize(cards)
      @cards_in_hand = cards
    end

    def hand_size
      cards_in_hand.size
    end

  end
end
