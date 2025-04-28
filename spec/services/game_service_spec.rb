require 'spec_helper'

RSpec.describe GameService do
  describe '.roll_dice' do
    it 'returns an array of 6 numbers between 1 and 6' do
      dice = GameService.roll_dice
      expect(dice.length).to eq(6)
      dice.each do |die|
        expect(die).to be_between(1, 6)
      end
    end
  end

  describe '.calculate_score' do
    it 'calculates the correct score for a roll' do
      dice = [1, 1, 1, 2, 2, 2]
      score = GameService.calculate_score(dice)
      expect(score).to eq(1000 + 200) # Three 1s = 1000, Three 2s = 200
    end
  end
end
