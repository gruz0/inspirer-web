# frozen_string_literal: true

FactoryBot.define do
  factory :activity_custom_workout do
    title { FFaker::Lorem.sentence }
    feeling { FEELINGS.keys.sample.to_s }
    account
  end
end
