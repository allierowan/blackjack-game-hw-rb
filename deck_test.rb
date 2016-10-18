require 'minitest/autorun'
require 'minitest/pride'
require_relative './deck'

class DeckTest <Minitest::Test
  def deck
    ::Deck.new
  end

  def test_a_deck_cards
    assert deck.deck_cards[0].is_a?(Card)
  end

  def test_b_52_cards
    assert_equal 52, deck.deck_cards.size
  end
end
