# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Player, type: :model do
  describe 'validations' do
    it 'is valid with a name and score' do
      player = build(:player)
      expect(player).to be_valid
    end

    it 'is invalid without a name' do
      player = build(:player, name: nil)
      expect(player).not_to be_valid
      expect(player.errors[:name]).to include("can't be blank")
    end

    it 'is invalid with a non-integer score' do
      player = build(:player, score: 1.5)
      expect(player).not_to be_valid
      expect(player.errors[:score]).to include('must be an integer')
    end
  end

  describe '#initialize_player' do
    it 'creates a new player with the given name and score 0' do
      player = Player.initialize_player('Test Player')
      expect(player.name).to eq('Test Player')
      expect(player.score).to eq(0)
    end
  end
end
