module StandardPlayingCards
  class Hand
    attr_accessor :cards_in_hand

    def initialize(cards)
      @cards_in_hand = cards
    end

    def hand_size
      cards_in_hand.size
    end

    def hand_score
      points_in_hand = cards_in_hand.map {|card| card.points}
      points_in_hand.reduce(:+)
    end

    def winning_hand?
      hand_score == 21
    end

  end
end
