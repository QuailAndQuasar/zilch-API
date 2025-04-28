# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    name { Faker::Name.name }
    score { 0 }
  end
end
