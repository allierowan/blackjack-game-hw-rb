module StandardPlayingCards
  class Blackjack

    attr_accessor :game_deck, :dealer_hand, :player_hand, :num_players, :player_last_move, :dealer_last_move

    def initialize
      @game_deck = Deck.new
      @dealer_hand = Hand.new([])
      @player_hand = Hand.new([])
      @num_players = 2
      @player_last_move = ""
      @dealer_last_move = ""
    end

    def deal_game!
      game_deck.shuffle_deck!
      counter = num_players
      counter.times do
        player_hand.cards_in_hand << game_deck.deal_card!
        dealer_hand.cards_in_hand << game_deck.deal_card!
      end
    end

    def hit_player!
      player_hand.cards_in_hand << game_deck.deal_card!
    end

    def hit_dealer!
      dealer_hand.cards_in_hand << game_deck.deal_card!
    end

    def both_players_stand?
      player_last_move == "Stand" && dealer_last_move == "Stand"
    end

    def game_over?
      player_hand.bust? || dealer_hand.bust? || player_hand.won? || dealer_hand.won? || both_players_stand?
    end

    def stand_game_winner
      if player_hand.points >= dealer_hand.points
        "Player"
      else
        "Dealer"
      end
    end

    def game_winner
      if player_hand.bust? || dealer_hand.won? || stand_game_winner == "Dealer"
        "Dealer"
      elsif player_hand.won? || dealer_hand.bust? || stand_game_winner == "Player"
        "Player"
      end
    end

    def dealer_move!
      if dealer_hand.hand_score >= 17
        @dealer_last_move = "Stand"
      else
        @dealer_last_move = "Hit"
        hit_dealer!
      end
    end
  end
end
