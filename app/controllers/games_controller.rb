class GamesController < ApplicationController
  def matching_game
    deck = Term.all.sample(15)
    @cards = deck.map(&:chinese_traditional)
  end
end
