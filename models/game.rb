# frozen_string_literal: true

class Game < ActiveRecord::Base
  belongs_to :player_one, class_name: 'Player'
  belongs_to :player_two, class_name: 'Player'

  validates :player_one, presence: true
  validates :player_two, presence: true

  def self.create_game(player_one, player_two)
    Game.create(player_one: player_one, player_two: player_two)
  end

  def self.roll_dice
    Array.new(6) { rand(1..6) }
  end
end
