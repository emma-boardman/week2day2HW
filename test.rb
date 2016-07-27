def game_intro
  # puts "Welcome to Snakes and Ladders, first to square #{ @game.target() } wins."
  puts "Player 1, enter your name:"
  player1_name = gets.chomp
  puts "Thanks #{player1_name}. Now it's Player 2's turn to enter their name:"
  player2_name = gets.chomp
  puts "Thanks #{player2_name}. Let's get the funtimes started!"
end 

game_intro