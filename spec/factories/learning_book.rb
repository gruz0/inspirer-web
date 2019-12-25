# frozen_string_literal: true

FactoryBot.define do
  factory :learning_book do
    title { FFaker::Book.title }
    status { LEARNING_BOOK_STATUSES.keys.sample.to_s }
    feeling { FEELINGS.keys.sample.to_s }
    account
  end
end
