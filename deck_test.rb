require 'minitest/autorun'
require 'minitest/pride'
require_relative './deck'
require 'set'
require_relative './deck_empty_error'

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
    assert_equal deck.deck_cards[0], deck.deal_card!
  end

  def test_f_dealt_card_gone
    test_deck = Deck.new
    dealt_card = test_deck.deal_card!
    assert_equal false, test_deck.deck_cards.include?(dealt_card)
  end

  def test_g_shuffled_cards
    test_deck = Deck.new
    index = rand(52)
    card_at_index = test_deck.deck_cards[index]
    test_deck.shuffle_deck!
    new_card_at_index = test_deck.deck_cards[index]
    refute_equal card_at_index, new_card_at_index
  end

  def test_h_input_deck
    one_diamonds = Card.new(1, "Diamonds")
    two_spades = Card.new(2, "Spades")
    test_deck = Deck.new([one_diamonds, two_spades])
    assert_equal test_deck.deck_cards[0], one_diamonds
  end

  def test_i_empty_deck
    one_diamonds = Card.new(1, "Diamonds")
    new_deck = Deck.new([one_diamonds])
    new_deck.deal_card!
    assert new_deck.empty?
  end

  def test_j_empty_deck_error
    one_diamonds = Card.new(1, "Diamonds")
    new_deck = Deck.new([one_diamonds])
    new_deck.deal_card!
    assert_raises(DeckEmptyError) do
      new_deck.deal_card!
    end
  end

  def test_k_empty_deck_error_shuffle
    one_diamonds = Card.new(1, "Diamonds")
    new_deck = Deck.new([one_diamonds])
    new_deck.deal_card!
    assert_raises(DeckEmptyError) do
      new_deck.shuffle_deck!
    end
  end
end
