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
    assert_equal 2, new_blackjack.player_hand.size
  end

  def test_deal_two_cards_dealer
    new_blackjack = StandardPlayingCards::Blackjack.new
    new_blackjack.deal_game!
    assert_equal 2, new_blackjack.dealer_hand.size
  end

  def test_player_hand_card
    new_blackjack = StandardPlayingCards::Blackjack.new
    new_blackjack.deal_game!
    assert new_blackjack.player_hand[0].is_a?(StandardPlayingCards::Card)
  end

  def test_dealer_hand_card
    new_blackjack = StandardPlayingCards::Blackjack.new
    new_blackjack.deal_game!
    assert new_blackjack.dealer_hand[0].is_a?(StandardPlayingCards::Card)
  end

  def test_hit_player
    new_blackjack = StandardPlayingCards::Blackjack.new
    new_blackjack.deal_game!
    new_blackjack.hit_player!
    assert_equal 3, new_blackjack.player_hand.length
  end

  def test_hit_dealer
    new_blackjack = StandardPlayingCards::Blackjack.new
    new_blackjack.deal_game!
    new_blackjack.hit_dealer!
    assert_equal 3, new_blackjack.dealer_hand.length
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

  def test_card_points
    two_diamond = StandardPlayingCards::Card.new(2, "Diamonds")
    assert_equal 2, blackjack.card_points(two_diamond)
  end

  def test_card_points_ace
    two_diamond = StandardPlayingCards::Card.new("A", "Diamonds")
    assert_equal 11, blackjack.card_points(two_diamond)
  end

  def test_card_points_king
    two_diamond = StandardPlayingCards::Card.new("K", "Diamonds")
    assert_equal 10, blackjack.card_points(two_diamond)
  end

  def test_player_hand_score
    blackjack_game = StandardPlayingCards::Blackjack.new
    blackjack_game.deal_game!
    p blackjack_game.player_score
  end
end
