require_relative "standard_playing_cards/card"
require_relative "standard_playing_cards/deck"
require_relative "standard_playing_cards/hand"
require_relative "standard_playing_cards/blackjack"
require_relative "standard_playing_cards/deck_empty_error"
require_relative "standard_playing_cards/invalid_card_input_error"

module StandardPlayingCards

  FACE_VALUES = (2..10).to_a + ["A", "K", "Q", "J"]
  SUIT_VALUES = ["Diamonds", "Hearts", "Spades", "Clubs"]

end
