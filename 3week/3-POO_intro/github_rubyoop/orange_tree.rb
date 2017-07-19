require 'pry'

class OrangeTreeOrchard
  def initialize(trees=[])
    @trees = trees
  end
  def one_year_all_trees
    @trees.each do |tree|
      tree.one_year_passes
    end
  end
  def count_all_oranges
    count = 0
    @trees.each do |tree|
      count += tree.count_the_oranges
    end
    count
  end
  def pick_all_orange
    @trees.each do |tree|
      tree.pick_an_orange
    end
  end
  def average_height
    height = 0
    count = 0
    @trees.each do |tree|
      count += 1
      height += tree.height
    end
    height = height.to_f / count
  end
  def average_oranges
    oranges = 0
    count = 0
    @trees.each do |tree|
      count += 1
      oranges += tree.oranges
    end
    oranges = oranges.to_f / count
  end
end


class OrangeTree
  attr_accessor :height, :age, :oranges
  @@trees = []
  def initialize(height=0)
    @height = height
    @age = 0
    @oranges = 0
    @@trees << self
  end

  def one_year_passes
    @age += 1
    @height += 1
    if age >= 5
      @oranges = 20 + @age
    end
    if age >= 50
      puts "The tree dies"
      @height = 0
      @age = 0
    end
    puts "#{@age} #{@height} #{@oranges}"
  end

  def count_the_oranges
    @oranges
  end

  def pick_an_orange
    @oranges -= 1 unless @oranges <= 0
  end
end

binding.pry

puts "end of code"
