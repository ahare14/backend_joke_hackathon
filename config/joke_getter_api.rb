require 'rest-client'
require 'json'
require 'pry'



class JokeGetter
  @@base_url = 'https://sv443.net/jokeapi/category/Any?blacklistFlags=religious,nsfw'
  @@all_jokes = []

  def self.get_data
    @@data = RestClient.get(@@base_url)
    @@response = JSON.parse(@@data)
    puts @@response
  end

  def self.populate
    while @@all_jokes.length < 93
      self.get_data
      if @@all_jokes.empty?
        @@all_jokes << @@response
      elsif !@@all_jokes.include?(@@response)
          @@all_jokes << @@response
      end
      sleep(3.1)
    end
  end
  binding.pry
end

# JokeGetter.populate
