# frozen_string_literal: true

FactoryBot.define do
  factory :activity_outdoor_walk do
    distance_unit { DISTANCE_UNITS.keys.sample.to_s }
    distance { rand(4.5...12.0) }
    steps { rand(6_000...15_000) }
    feeling { FEELINGS.keys.sample.to_s }
    account
  end
end
