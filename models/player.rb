# frozen_string_literal: true

class Player < ActiveRecord::Base
  belongs_to :game

  validates :name, presence: true
  validates :score, numericality: { only_integer: true }

  def self.initialize_player(name)
    player = Player.new(name: name, score: 0)
    player.save
    player
  end
end
