require "pry"
require_relative "./dog.rb"
require_relative "./cat.rb"

class Owner
  
  
  
  attr_accessor
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    
    @@all<<self
  end

  def say_species
    "I am a #{@species}."
  end
  
  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select do |cat| 
      cat.owner == self  
    end
    
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(new_cat)
    x = Cat.new(new_cat, self)
    @@all << x
  end

  def buy_dog(new_dog)
    
    x = Dog.new(new_dog, self)
    @@all << x
    # binding.pry
  end

  def walk_dogs
    Dog.all.each do |dog|
      
      dog.mood = "happy"
      
    end
  end

  def feed_cats
    Cat.all.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    Dog.all.each do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end

    Cat.all.each do |cat|
      cat.owner = nil
      cat.mood = "nervous"
    end

    def list_pets
      # binding.pry
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end
  end


  



end