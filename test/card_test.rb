require 'minitest/autorun'
require 'minitest/pride'
require_relative '../standard_playing_cards'

class CardTest <Minitest::Test

  def card
    StandardPlayingCards::Card.new(9, "Diamonds")
  end

  def test_a_card_value
    assert_equal card.face_value, 9
  end

  def test_b_card_suit
    assert_equal card.suit, "Diamonds"
  end

  def test_c_card_equality
    card1 = StandardPlayingCards::Card.new(9, "Diamonds")
    assert_equal card, card1
  end

  def test_d_card_inequality
    card1 = StandardPlayingCards::Card.new(10, "Diamonds")
    refute_equal card, card1
  end

  def test_card_score
    ace_diamonds = StandardPlayingCards::Card.new("A", "Diamonds")
    assert_equal 11, ace_diamonds.points
  end
end
