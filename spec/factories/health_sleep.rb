# frozen_string_literal: true

FactoryBot.define do
  factory :health_sleep do
    woke_up_at_hour { rand(0...23) }
    woke_up_at_minutes { rand(0...59) }
    feeling { FEELINGS.keys.sample.to_s }
    account
  end
end
