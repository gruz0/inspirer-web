# frozen_string_literal: true

module Learning
  module Videos
    module Schemas
      VideoSchema = Dry::Schema.Params do
        required(:attributes).hash do
          required(:url).filled(Types::StrippedString)
          optional(:title).value(Types::StrippedString, max_size?: 100)
          required(:feeling).filled(Types::Feeling)
          optional(:notes).value(Types::StrippedString)
          optional(:created_at).maybe(Types::Params::DateTime)
        end
      end
    end
  end
end
