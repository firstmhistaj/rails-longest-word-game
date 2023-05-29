require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    word = params[:word]
    letters = params[:letters]

    # Check if the word can be built out of the original grid
    if word.chars.all? { |char| word.count(char) <= letters.count(char) }
      # Check if the word is a valid English word
      response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
      word_valid = JSON.parse(response.read)

      if word_valid
        @result = "Congratulations! #{word.upcase} is a valid English word!"
      else
        @result = "Sorry, #{word.upcase} does not seem to be a valid English word."
      end
    else
      @result = "Sorry, #{word.upcase} can't be built out of the original grid."
    end
  end
end


# <%= link_to ANCHOR_TEXT, ANCHOR_URL %>
