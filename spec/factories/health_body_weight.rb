# frozen_string_literal: true

FactoryBot.define do
  factory :health_body_weight do
    weight { rand(85.0...110.0) }
    unit { WEIGHT_UNITS.keys.sample.to_s }
    feeling { FEELINGS.keys.sample.to_s }
    account
  end
end
