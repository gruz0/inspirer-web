# frozen_string_literal: true

FactoryBot.define do
  factory :activity_yoga_asana do
    notes { FFaker::Lorem.paragraph }
    feeling { FEELINGS.keys.sample.to_s }
    account
  end
end
