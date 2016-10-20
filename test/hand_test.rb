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

end
