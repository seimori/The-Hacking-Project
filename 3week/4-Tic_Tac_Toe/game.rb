require 'pry'
require_relative 'player'
require_relative 'board'
require_relative 'boardcase'

class Game
  attr_reader :game_turn, :player1, :player2
  def initialize
    @game_turn = 0
    @player1 = Player.new
    @player2 = Player.new
  end
  def ask_name
    print "Player 1 name?: "
    @player1.name = gets.chomp
    print "Player 2 name?: "
    @player2.name = gets.chomp
    puts "List of players: #{@player1.name} vs #{@player2.name}"
  end

end

one = Game.new
one.ask_name

binding.pry

puts "End of code"
