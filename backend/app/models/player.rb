# frozen_string_literal: true

class Player < ApplicationRecord
  validates_presence_of :name
  before_save :calculate_winloss, only: %i[create]

  def calculate_winloss
    wins =  self.wins
    losses = self.losses
    draws = self.draws

    top = wins + (0.5 * draws)
    bottom = wins + losses + draws
    self.winloss = (top / bottom) * 100
  end
end
