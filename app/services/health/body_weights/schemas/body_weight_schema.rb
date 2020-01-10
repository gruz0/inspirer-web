# frozen_string_literal: true

module Health
  module BodyWeights
    module Schemas
      BodyWeightSchema = Dry::Schema.Params do
        required(:attributes).hash do
          required(:weight).filled(Types::Coercible::FloatWithComma) { gt?(0) }
          required(:unit).filled.value(included_in?: WEIGHT_UNITS.keys.map(&:to_s))
          required(:feeling).filled(Types::Feeling)
          optional(:notes).value(Types::StrippedString)
        end
      end
    end
  end
end
