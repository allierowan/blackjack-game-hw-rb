require 'minitest/autorun'
require 'minitest/pride'
require_relative '../standard_playing_cards'

class HandTest <Minitest::Test

  def test_size_of_hand
    ace_diamonds = StandardPlayingCards::Card.new("A", "Diamonds")
    four_spades = StandardPlayingCards::Card.new(4, "Spades")
    my_hand = StandardPlayingCards::Hand.new([ace_diamonds, four_spades])
    assert_equal 2, my_hand.hand_size
  end

  def test_hand_score
    two_diamonds = StandardPlayingCards::Card.new(2, "Diamonds")
    king_spades = StandardPlayingCards::Card.new("K", "Spades")
    my_hand = StandardPlayingCards::Hand.new([two_diamonds, king_spades])
    assert_equal 12, my_hand.hand_score
  end

  def test_winning_hand
    ace_diamonds = StandardPlayingCards::Card.new("A", "Diamonds")
    king_spades = StandardPlayingCards::Card.new("K", "Spades")
    my_hand = StandardPlayingCards::Hand.new([ace_diamonds, king_spades])
    assert my_hand.won?
  end

  def test_winning_hand_three_cards
    two_diamonds = StandardPlayingCards::Card.new(2, "Diamonds")
    king_spades = StandardPlayingCards::Card.new("K", "Spades")
    nine_clubs = StandardPlayingCards::Card.new(9, "Clubs")
    my_hand = StandardPlayingCards::Hand.new([two_diamonds, king_spades, nine_clubs])
    assert my_hand.won?
  end

  def test_bust_hand
    ace_diamonds = StandardPlayingCards::Card.new("A", "Diamonds")
    king_spades = StandardPlayingCards::Card.new("K", "Spades")
    four_hearts = StandardPlayingCards::Card.new(4, "Hearts")
    my_hand = StandardPlayingCards::Hand.new([ace_diamonds, king_spades, four_hearts])
    assert my_hand.bust?
  end
end
