# frozen_string_literal: true

module Learning
  module Articles
    module Schemas
      ArticleSchema = Dry::Schema.Params do
        required(:attributes).hash do
          required(:url).filled(Types::StrippedString)
          optional(:title).value(Types::StrippedString, max_size?: 100)
          required(:feeling).filled.value(included_in?: FEELINGS.keys.map(&:to_s))
          optional(:notes).value(Types::StrippedString)
        end
      end
    end
  end
end
