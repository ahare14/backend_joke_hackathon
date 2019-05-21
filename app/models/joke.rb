require 'pry'

class Joke < ApplicationRecord
 @@all_jokes = []
 @@single_jokes = []

  def self.non_dark_jokes
    @jokes = Joke.all
    @jokes.select do |joke|
      if joke.category != "Dark"
        @@all_jokes << joke
      end
    end
  end

  def self.single_jokes
    @@all_jokes.each do |joke|
      if @@all_jokes.style == "single"
        @@single_jokes << @@all_jokes.joke
      end
    end
  end

  def self.rand_single_joke
    @@single_jokes.sample
  end




end
