# frozen_string_literal: true

FactoryBot.define do
  factory :health_body_measure do
    chest { rand(95.0...110.0) }
    waist { rand(65.0...80.0) }
    hips { rand(95.0...110.0) }
    unit { BODY_MEASURE_UNITS.keys.sample.to_s }
    feeling { FEELINGS.keys.sample.to_s }
    account
  end
end
