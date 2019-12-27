# frozen_string_literal: true

module Activity
  module CustomWorkouts
    module Schemas
      CustomWorkoutSchema = Dry::Schema.Params do
        required(:attributes).hash do
          required(:title).filled(Types::StrippedString, max_size?: 100)
          required(:feeling).filled.value(included_in?: FEELINGS.keys.map(&:to_s))
          optional(:notes).value(Types::StrippedString)
        end
      end
    end
  end
end