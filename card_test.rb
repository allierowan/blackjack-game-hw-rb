require 'minitest/autorun'
require 'minitest/pride'
require_relative './card'

class CardTest <Minitest::Test

  def card
    ::Card.new(9, "diamonds")
  end

  def test_a_card_value
    assert_equal card.face_value, 9
  end

  def test_b_card_suit
    assert_equal card.suit, "diamonds"
  end

end
