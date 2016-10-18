require 'minitest/autorun'
require 'minitest/pride'
require_relative './deck'
require 'set'

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

  def test_c_has_13_values
    value_set = Set.new
    deck.deck_cards.each do |card|
      value_set << card.face_value
    end
    assert_equal 13, value_set.size
  end

  def test_d_has_4_suits
    suit_set = Set.new
    deck.deck_cards.each do |card|
      suit_set << card.suit
    end
    assert_equal Set["Diamonds", "Hearts", "Clubs", "Spades"], suit_set
  end

  def test_e_deal_card
    assert_equal true, deck.deal_card!.is_a?(Card), "deal doesn't return a card"
  end

  def test_f_dealt_card_gone
    test_deck = Deck.new
    dealt_card = test_deck.deal_card!
    assert_equal false, test_deck.deck_cards.include?(dealt_card)
  end
end
