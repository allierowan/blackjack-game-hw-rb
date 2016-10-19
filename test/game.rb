require_relative '../standard_playing_cards'

curr_game = StandardPlayingCards::Blackjack.new
curr_game.deal_game!

def game_over?(game)
  game.winning_hand?(game.player_hand) || game.winning_hand?(game.dealer_hand) || (game.dealer_last_move == "Stand" && game.player_last_move == "Stand") || player_bust?(game) || dealer_bust?(game)
end

def check_score(game, hand)
  game.hand_score(hand)
end

def player_bust?(game)
  game.hand_score(game.player_hand) > 21
end

def dealer_bust?(game)
  game.hand_score(game.dealer_hand) > 21
end

def put_hand(hand)
  hand.each do |card|
    puts "#{card.face_value} of #{card.suit}"
  end
end

def put_dealer_hand(hand)
  puts "#{hand[1].face_value} of #{hand[1].suit}"
end

def hit_or_stand(game, direction)
  if direction == "Hit"
    game.hit_player!
    game.player_last_move = "Hit"
  elsif direction == "Stand"
    game.player_last_move = "Stand"
  end
end

puts "Welcome to Blackjack. You have:"
put_hand(curr_game.player_hand)
puts "The dealer's upcard is:"
put_dealer_hand(curr_game.dealer_hand)

if curr_game.winning_hand?(curr_game.player_hand)
  puts "You got blackjack!"
elsif curr_game.winning_hand?(curr_game.dealer_hand)
  puts "The dealer got blackjack! Their hand was"
  put_hand(curr_game.dealer_hand)
else
  until game_over?(curr_game)
    puts "Your turn. Would you like to hit or stand? Type Hit/Stand"
    direction = gets.chomp
    hit_or_stand(curr_game, direction)
    if player_bust?(curr_game)
      puts "You got a #{curr_game.player_hand.last.face_value} of #{curr_game.player_hand.last.suit}"
      puts "You bust. Game over"
      break
    elsif direction == "Hit"
      puts "You got a #{curr_game.player_hand.last.face_value} of #{curr_game.player_hand.last.suit}"
      puts "Your hand is now:"
      put_hand(curr_game.player_hand)
    end
    puts "Now its the dealer's turn"
    curr_game.dealer_move!
    puts "The dealer will #{curr_game.dealer_last_move}"
    if dealer_bust?(curr_game)
      puts "Dealer bust! Game over"
    elsif curr_game.winning_hand?(curr_game.dealer_hand)
      puts "The dealer got blackjack! Game over."
    end
    if curr_game.player_last_move == "Stand" && curr_game.dealer_last_move == "Stand"
      puts curr_game.who_won
      puts "Your final score was #{curr_game.hand_score(curr_game.player_hand)}. The dealer had #{curr_game.hand_score(curr_game.dealer_hand)}"
    end
  end
end
