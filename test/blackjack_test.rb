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

end
