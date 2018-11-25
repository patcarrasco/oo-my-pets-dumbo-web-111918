require 'pry'

class Owner
  # code goes here

  @@all = []

  def initialize(species)
    @species = species
    @pets =
    {
      fishes: [],
      cats: [],
      dogs: []
    }
    @@all << self
  end

  attr_accessor :pets, :name
  attr_reader :species

  ## ---------- Instance Methods ----------
  def say_species
    "I am a #{species}."
    # binding.pry
  end

  def buy_fish(name)
    new_pet = Fish.new(name)
    pets[:fishes] << new_pet
  end

  def buy_cat(name)
    new_pet = Cat.new(name)
    pets[:cats] << new_pet
  end

  def buy_dog(name)
    new_pet = Dog.new(name)
    pets[:dogs] << new_pet
  end

  def walk_dogs
    pets[:dogs].each {|dog| dog.mood = "happy"}
    "Walking the dogs"
  end

  def play_with_cats
    pets[:cats].each {|cat| cat.mood = "happy"}
    "Playing with the cats"
  end

  def feed_fish
    pets[:fishes].each {|fish| fish.mood = "happy"}
    "Feeding the fish"
  end

  def sell_pets
    pets.each {|species, pets| pets.each {|pet| pet.mood = 'nervous'}}
    pets.clear
    "Here, Take them. Take them all."
  end

  def list_pets
    "I have #{counter("fishes")} fish, #{counter("dogs")} dog(s), and #{counter("cats")} cat(s)."
  end
  ## ---------- Class Methods ----------

  def self.all
    @@all
  end

  def self.count
    all.count
  end

  def self.reset_all
    all.clear
  end

  # ------------ Private Methods ------------
  private

  def counter(species)
    pets[species.to_sym].count
  end

end
