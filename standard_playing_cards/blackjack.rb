module StandardPlayingCards
  class Blackjack

    CARD_SCORES = {"A"=> 11, "K"=> 10, "Q"=> 10, "J"=> 10}
    attr_accessor :game_deck, :dealer_hand, :player_hand, :num_players, :player_last_move, :dealer_last_move

    def initialize
      @game_deck = Deck.new
      @dealer_hand = []
      @player_hand = []
      @num_players = 2
      @player_last_move = ""
      @dealer_last_move = ""
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

    def hand_score(hand)
      score = 0
      hand.each do |card|
        score += card_points(card)
      end
      return score
    end

    def winning_hand?(hand)
      hand_score(hand) == 21
    end

    def who_won
      if hand_score(player_hand) >= hand_score(dealer_hand)
        "Player won."
      else
        "Dealer won."
      end
    end

    def dealer_move!
      if hand_score(dealer_hand) >= 17
        @dealer_last_move = "Stand"
      else
        @dealer_last_move = "Hit"
        hit_dealer!
      end
    end



  end
end
