class GamesController < ApplicationController
  def matching_game
    @cards = Term.all.sample(16)
  end
end
