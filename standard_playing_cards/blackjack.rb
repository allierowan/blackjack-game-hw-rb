module StandardPlayingCards
  class Blackjack

    CARD_SCORES = {"A"=> 11, "K"=> 10, "Q"=> 10, "J"=> 10}
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

    def card_points(card)
      if CARD_SCORES[card.face_value]
        CARD_SCORES[card.face_value]
      else
        card.face_value
      end
    end

    def player_score
      score = 0
      player_hand.each do |card|
        score += card_points(card)
      end
      return score
    end

    def dealer_score
      score = 0
      dealer_hand.each do |card|
        score += card_points(card)
      end
      return score
    end

  end
end
