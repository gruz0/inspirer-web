# frozen_string_literal: true

module Health
  module Meditations
    module Schemas
      MeditationSchema = Dry::Schema.Params do
        required(:attributes).hash do
          required(:notes).filled(Types::StrippedString)
          required(:feeling).filled(Types::Feeling)
          optional(:created_at).maybe(Types::Params::DateTime)
        end
      end
    end
  end
end
