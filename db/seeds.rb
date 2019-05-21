# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'json'

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
      if !@@all_jokes.include?(@@response)
        Joke.create(joke_id: @@response['id'], category: @@response['category'], style: @@response['type'], setup: @@response['setup'], delivery: @@response['delivery'], joke: @@response['joke'], nsfw: @@response['nsfw'], political: @@response['political'], religious: @@response['religious'])
          @@all_jokes << @@response
      end
      sleep(3.1)
    end
  end
end

JokeGetter.populate
