# frozen_string_literal: true

module Learning
  module Podcasts
    module Schemas
      PodcastSchema = Dry::Schema.Params do
        required(:attributes).hash do
          required(:url).filled(Types::StrippedString)
          optional(:title).value(Types::StrippedString, max_size?: 100)
          required(:feeling).filled(Types::Feeling)
          optional(:notes).value(Types::StrippedString)
        end
      end
    end
  end
end
