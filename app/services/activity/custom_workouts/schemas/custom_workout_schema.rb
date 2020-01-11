# frozen_string_literal: true

module Activity
  module CustomWorkouts
    module Schemas
      CustomWorkoutSchema = Dry::Schema.Params do
        required(:attributes).hash do
          required(:title).filled(Types::StrippedString, max_size?: 100)
          required(:feeling).filled(Types::Feeling)
          optional(:notes).value(Types::StrippedString)
        end
      end
    end
  end
end
