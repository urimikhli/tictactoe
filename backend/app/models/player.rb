# frozen_string_literal: true

class Player < ApplicationRecord
  validates_presence_of :name

  def self.calculate_winloss(player)
    wins =  player.wins
    losses = player.losses
    draws = player.draws

    top = wins.to_f + (draws * 0.5.to_f).to_f
    bottom = wins + losses + draws
    ( top.to_f / bottom.to_f ) * 100.to_f
  end
end
