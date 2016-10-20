require_relative '../standard_playing_cards'

play_again = true

until !play_again
  curr_game = StandardPlayingCards::Blackjack.new
  curr_game.deal_game!

  puts "Welcome to Blackjack. The dealer has dealt the game"
  puts "\nYour hand is:"
  curr_game.player_hand.show_player_hand

  puts "\nThe dealer's upcard is:"
  curr_game.dealer_hand.show_dealer_hand

  until curr_game.game_over?
    if curr_game.player_last_move != "Stand"
      puts "Would you like to Hit or Stand? (Hit/Stand)"
      input = gets.chomp
      curr_game.player_turn(input)

      puts "Thank you. Your hand is now:"
      curr_game.player_hand.show_player_hand
    end

    if !curr_game.game_over?
      curr_game.dealer_turn!
      dealer_move = curr_game.dealer_last_move
      puts "Now the dealer's turn. The dealer's move was: #{dealer_move}"
    end
  end

  puts "#{curr_game.game_winner} won!"
  puts curr_game.game_over_reason
  puts "Would you like to play again? Y/N"
  input = gets.chomp
  play_again = false unless input == "Y"
end
