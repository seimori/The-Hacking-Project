require 'pry'
require_relative 'boardcase'

class Board
  attr_accessor :grid_hash, :a1_case, :b1_case, :c1_case,
    :a2_case, :b2_case, :c2_case,
    :a3_case, :b3_case, :c3_case

  def initialize
    @grid_hash = Hash.new
    @grid_hash = {a1: 6, b1: 1, c1: 8,
                  a2: 7, b2: 5, c2: 3,
                  a3: 2, b3: 9, c3: 4}
    @a1_case = BoardCase.new
    @b1_case = BoardCase.new
    @c1_case = BoardCase.new
    @a2_case = BoardCase.new
    @b2_case = BoardCase.new
    @c2_case = BoardCase.new
    @a3_case = BoardCase.new
    @b3_case = BoardCase.new
    @c3_case = BoardCase.new

  end
  def display_board
=begin  Grid_code display => if sum_of_3 = 15 => WIN
    puts "     A     B     C  "
    puts "        |     |     "
    puts " 1   6  |  1  |  8  "
    puts "   _____|_____|_____"
    puts "        |     |     "
    puts " 2   7  |  5  |  3  "
    puts "   _____|_____|_____"
    puts "        |     |     "
    puts " 3   2  |  9  |  4  "
    puts "        |     |     "
=end

    puts "     A     B     C  "
    puts "        |     |     "
    puts " 1   #{@a1_case.case_state}  |  #{@b1_case.case_state}  |  #{@c1_case.case_state}  "
    puts "   _____|_____|_____"
    puts "        |     |     "
    puts " 2   #{@a2_case.case_state}  |  #{@b2_case.case_state}  |  #{@c2_case.case_state}  "
    puts "   _____|_____|_____"
    puts "        |     |     "
    puts " 3   #{@a3_case.case_state}  |  #{@b3_case.case_state}  |  #{@c3_case.case_state}  "
    puts "        |     |     "

  end
end

#test = Board.new
#puts test.grid_hash
#binding.pry

#puts "end code"
#test.display_board
