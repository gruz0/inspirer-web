# frozen_string_literal: true

FactoryBot.define do
  factory :learning_video do
    url { FFaker::Internet.http_url }
    feeling { FEELINGS.keys.sample.to_s }
    account
  end
end
