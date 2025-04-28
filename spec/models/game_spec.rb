# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Game, type: :model do
  describe 'validations' do
    it 'is valid with two players' do
      game = build(:game)
      expect(game).to be_valid
    end

    it 'is invalid without player_one' do
      game = build(:game, player_one: nil)
      expect(game).not_to be_valid
      expect(game.errors[:player_one]).to include("can't be blank")
    end

    it 'is invalid without player_two' do
      game = build(:game, player_two: nil)
      expect(game).not_to be_valid
      expect(game.errors[:player_two]).to include("can't be blank")
    end
  end

  describe '.create_game' do
    it 'creates a new game with the given players' do
      player1 = create(:player)
      player2 = create(:player)
      game = Game.create_game(player1, player2)
      expect(game.player_one).to eq(player1)
      expect(game.player_two).to eq(player2)
    end
  end

  describe '.roll_dice' do
    it 'returns an array of 6 numbers between 1 and 6' do
      dice = Game.roll_dice
      expect(dice.length).to eq(6)
      dice.each do |die|
        expect(die).to be_between(1, 6)
      end
    end
  end
end
