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

    def won?
      hand_score == 21
    end

    def bust?
      hand_score > 21
    end

    def show_player_hand
      cards_in_hand.each do |card|
        puts card.show
      end
    end

    def show_dealer_hand
      puts cards_in_hand[1].show
    end

  end
end
