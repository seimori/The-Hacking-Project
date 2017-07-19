require 'pry'

class Group
  attr_accessor :people
  @@people_count = 0
  def initialize(start_people = [])
    @people = start_people
    @@people_count += 1
  end

  def add_person(person)
    @people << person
  end
end

class Person
  attr_accessor :name, :age
  @@people_count = 0
  @@people = []
  @@class_name = "Person"
  def initialize(name, age)
    @name = name
    @age = age
    @@people_count += 1
  end
  def get_class_name
    puts @@class_name
  end
  def say_name
    puts "My name is #{@name}."
  end
  def say_age
    puts "I am #{@age} years old."
  end
  def check_vote
    @age>=18? "You can vote" : "Wait for #{18 - @age} years"
  end
  def self.count_people
    @@people_count
  end
  def compare_age(person)
    (@age>person.age)? "#{@name} is older than #{person.name}" : "#{@name} is not older than #{person.name}"
  end

end

class LoudPerson < Person
  @@class_name = "LoudPerson"
  def say_name
    puts "HEY YOU, MY NAME IS #{@name.upcase}!"
  end
  def get_class_name
    puts @@class_name
  end
end

class QuietPerson < Person
  def say_name
    puts "hey, I'm #{@name.downcase}..."
  end
end

class VeryLoudPerson < LoudPerson
  def say_age
    puts "I'M #{@age} YEARS OLD!"
  end
end

class TwoHeadedPerson < Person
  attr_accessor :second_name
  def initialize(name, age, second_name)
    super(name, age)
    @second_name = second_name
  end
end

andy = Person.new("Andy", 25)
suzy = Person.new("Suzy", 23)
bob = LoudPerson.new("Bob", 20)
lizzy = QuietPerson.new("Lizzy", 15)
carl = VeryLoudPerson.new("Carl", 40)
ben = TwoHeadedPerson.new("Ben", 35, "Bob")

binding.pry

puts "End of code"
