require 'minitest/autorun'
require 'minitest/pride'
require_relative '../standard_playing_cards'

class BlackjackTest < Minitest::Test

  def blackjack
    StandardPlayingCards::Blackjack.new
  end

  def test_has_game_deck
    assert blackjack.game_deck.is_a?(StandardPlayingCards::Deck)
  end

  def test_deal_two_cards_player
    new_blackjack = StandardPlayingCards::Blackjack.new
    new_blackjack.deal_game!
    assert_equal 2, new_blackjack.player_hand.hand_size
  end

  def test_deal_two_cards_dealer
    new_blackjack = StandardPlayingCards::Blackjack.new
    new_blackjack.deal_game!
    assert_equal 2, new_blackjack.dealer_hand.hand_size
  end

  def test_hit_player
    new_blackjack = StandardPlayingCards::Blackjack.new
    new_blackjack.deal_game!
    new_blackjack.hit_player!
    assert_equal 3, new_blackjack.player_hand.hand_size
  end

  def test_hit_dealer
    new_blackjack = StandardPlayingCards::Blackjack.new
    new_blackjack.deal_game!
    new_blackjack.hit_dealer!
    assert_equal 3, new_blackjack.dealer_hand.hand_size
  end

  def test_hit_player_updates_deck
    new_blackjack = StandardPlayingCards::Blackjack.new
    new_blackjack.deal_game!
    new_blackjack.hit_player!
    assert_equal 47, new_blackjack.game_deck.num_cards_left
  end

  def test_hit_dealer_updates_deck
    new_blackjack = StandardPlayingCards::Blackjack.new
    new_blackjack.deal_game!
    new_blackjack.hit_dealer!
    assert_equal 47, new_blackjack.game_deck.num_cards_left
  end

  def test_both_players_stand
    new_game = StandardPlayingCards::Blackjack.new
    new_game.deal_game!
    new_game.dealer_last_move = "Stand"
    new_game.player_last_move = "Stand"
    assert new_game.both_players_stand?
  end

  def test_game_over
    new_game = StandardPlayingCards::Blackjack.new
    new_game.deal_game!
    new_game.dealer_last_move = "Stand"
    new_game.player_last_move = "Stand"
    assert new_game.game_over?
  end

  def test_winner
    new_game = StandardPlayingCards::Blackjack.new
    new_game.deal_game!
    new_game.player_hand = Hand.new([Card.new("A", "Diamonds"), Card.new("K", "Hearts")])
    new_game.dealer_hand = Hand.new([Card.new("3", "Diamonds"), Card.new("K", "Spades")])
    assert_equal "Player", new_game.game_winner
  end

end
