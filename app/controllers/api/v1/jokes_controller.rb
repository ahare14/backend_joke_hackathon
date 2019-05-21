# require 'rest-client'
# require 'json'
require 'pry'

class Api::V1::JokesController < ApplicationController
  before_action :find_joke, only: [:update]
  @@all_jokes = []
  @@single_jokes = []

   def non_dark_jokes
     @jokes = Joke.all
     @jokes.each do |joke|
       if joke.category != "Dark"
         @@all_jokes << joke
       end
     end
   end

   def single_jokes_alt
     @jokes = Joke.all
     @jokes.each do |joke|
       if joke.category != "Dark"
         @@all_jokes << joke
       end
     end
     @@all_jokes.each do |joke|
       if joke.style == 'single'
         @@single_jokes << joke
       end
     end
     @@single_jokes
   end

   def single_jokes
     @@all_jokes.each do |joke|
       if @@all_jokes.style == "single"
         @@single_jokes << @@all_jokes.joke
       end
     end
     byebug
   end

   def rand_single_joke
     @@single_jokes.sample
   end

    def index
      @jokes = single_jokes_alt
      render json: @jokes
    end

    def update
      @joke.update(joke_params)
      if @joke.save
        render json: @joke, status: :accepted
      else
        render json: { errors: @joke.errors.full_messages }, status: :unprocessible_entity
      end
    end

    private

    def joke_params
      params.permit(:title, :content)
    end

    def find_joke
      @joke = Joke.find(params[:id])
    end

end
