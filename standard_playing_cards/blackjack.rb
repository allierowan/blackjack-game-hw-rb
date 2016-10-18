module StandardPlayingCards
  class Blackjack

    attr_accessor :game_deck, :dealer_hand, :player_hand

    def initialize
      @game_deck = Deck.new
      @dealer_hand = []
      @player_hand = []
    end

  end
end
