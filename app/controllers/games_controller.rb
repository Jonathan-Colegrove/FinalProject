class GamesController < ApplicationController
  def matching_game
    @terms = Term.all
    @cards = @terms.sample(15)
  end
end
