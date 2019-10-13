# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    email { FFaker::Internet.safe_email }
    password { FFaker::Internet.password }
    website { FFaker::Internet.http_url }
  end
end
