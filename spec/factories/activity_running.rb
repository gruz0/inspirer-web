# frozen_string_literal: true

FactoryBot.define do
  factory :activity_running do
    distance_unit { DISTANCE_UNITS.keys.sample.to_s }
    distance { rand(4.5...12.0) }
    feeling { FEELINGS.keys.sample.to_s }
    account
  end
end
