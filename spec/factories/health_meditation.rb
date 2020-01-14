# frozen_string_literal: true

FactoryBot.define do
  factory :health_meditation do
    notes { FFaker::Lorem.paragraph }
    feeling { FEELINGS.keys.sample.to_s }
    account
  end
end
