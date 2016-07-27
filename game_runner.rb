require_relative ('./game')
require_relative('./adjuster')

class GameRunner

  attr_reader :players, :target
  attr_writer :players

  def initialize(game)
    @game = game
    @players = [{
      name: player1_name, position: 0},
      {name: player2_name, position: 0}
    ]
  end 

  def game_intro(player1_name, player2_name)
    @players = []
    puts "Welcome to Snakes and Ladders, first to square #{ @game.target() } wins."
    puts "Player 1, enter your name:"
    player1_name = gets.chomp
    players[:name] = player1_name
    puts "Thanks #{player1_name}. Now it's Player 2's turn to enter their name:"
    player2_name = gets.chomp
    players[:name] = player1_name

    puts "Thanks #{player2_name}. Let's get the funtimes started!"
  end 

  def run_game
    # for player in @players
    # puts "Player #{player.index}, please enter your name:"
    # player[:name] = gets.chomp
    # end
    while( !@game.winner() ) do
      play_turn()
    end
 puts "#{ @game.winner[:name]} wins the game. Woo."
  end


def play_turn
  puts "#{@game.current_player()[:name]}. Press enter to roll dice."
  gets
  info = @game.play_turn( rand(1..6) )
  show_turn_info(info)
end

def show_turn_info(turn_info)
  puts "#{turn_info[:player_name]} rolled a #{turn_info[:roll]}."

  adjustment = turn_info[:adjustment]

  if( adjustment )
    if ( adjustment > 0)
      puts "Nice, you hit a ladder. Move forward #{adjustment}"
    else 
      puts "Ooh, snake! Move back #{ adjustment }" 
    end
  end

  puts "#{turn_info[:player_name]} now at position #{turn_info[:end_position]}"
  puts "\n"
end

adjuster = Adjuster.new ( {4 => 2, 6 => -1})
game = Game.new( 8, adjuster)
runner = GameRunner.new ( game )
runner.run_game()
end

