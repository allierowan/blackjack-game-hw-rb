module StandardPlayingCards
  class Blackjack

    attr_accessor :game_deck, :dealer_hand, :player_hand, :num_players

    def initialize
      @game_deck = Deck.new
      @dealer_hand = []
      @player_hand = []
      @num_players = 2
    end

    def deal_game!
      game_deck.shuffle_deck!
      counter = num_players
      counter.times do
        player_hand << game_deck.deal_card!
        dealer_hand << game_deck.deal_card!
      end
    end

    def hit_player!
      player_hand << game_deck.deal_card!
    end

    def hit_dealer!
      dealer_hand << game_deck.deal_card!
    end
  end
end
