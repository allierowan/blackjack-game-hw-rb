class Card

  attr_reader :face_value, :suit

  def initialize(face_value, suit)
    @face_value = face_value
    @suit = suit
  end

  def ==(other_card)
    face_value == other_card.face_value && suit == other_card.suit
  end

end
