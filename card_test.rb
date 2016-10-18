require 'minitest/autorun'
require 'minitest/pride'
require_relative './card'

class CardTest <Minitest::Test

  def card
    ::Card.new(9, "Diamonds")
  end

  def test_a_card_value
    assert_equal card.face_value, 9
  end

  def test_b_card_suit
    assert_equal card.suit, "Diamonds"
  end

  def test_c_card_equality
    card1 = Card.new(9, "Diamonds")
    assert_equal card, card1
  end

  def test_d_card_inequality
    card1 = Card.new(10, "Diamonds")
    refute_equal card, card1
  end
end
