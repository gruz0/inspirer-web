# frozen_string_literal: true

module Learning
  module Books
    module Schemas
      BookSchema = Dry::Schema.Params do
        required(:attributes).hash do
          required(:title).filled(:string, max_size?: 100)
          optional(:author).value(:string, max_size?: 100)
          optional(:url).value(:string)
          required(:status).filled.value(included_in?: LEARNING_BOOK_STATUSES.keys.map(&:to_s))
          required(:feeling).filled.value(included_in?: FEELINGS.keys.map(&:to_s))
          optional(:notes).value(:string)
        end
      end
    end
  end
end
