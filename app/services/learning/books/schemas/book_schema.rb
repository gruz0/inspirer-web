# frozen_string_literal: true

module Learning
  module Books
    module Schemas
      BookSchema = Dry::Schema.Params do
        required(:attributes).hash do
          required(:title).filled(Types::StrippedString, max_size?: 100)
          optional(:author).value(Types::StrippedString, max_size?: 100)
          optional(:url).value(Types::StrippedString)
          required(:status).filled.value(included_in?: LEARNING_BOOK_STATUSES.keys.map(&:to_s))
          required(:feeling).filled(Types::Feeling)
          optional(:notes).value(Types::StrippedString)
        end
      end
    end
  end
end
