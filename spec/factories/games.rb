# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    association :player_one, factory: :player
    association :player_two, factory: :player
  end
end
