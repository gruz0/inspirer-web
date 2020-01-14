# frozen_string_literal: true

module Health
  module Meditations
    module Schemas
      MeditationSchema = Dry::Schema.Params do
        required(:attributes).hash do
          required(:notes).filled(Types::StrippedString)
          required(:feeling).filled(Types::Feeling)
        end
      end
    end
  end
end
