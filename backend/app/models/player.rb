# frozen_string_literal: true

class Player < ApplicationRecord
  validates_presence_of :name
  before_save :calculate_winloss, only: %i[create update]

  def calculate_winloss
    wins =  self.wins
    losses = self.losses
    draws = self.draws

    top = wins + (draws * 0.5.to_d)
    bottom = wins + losses + draws
    winloss =  ( top.to_d / bottom.to_d ).to_d * 100.to_d
    self.winloss = winloss.to_d
  end
end
