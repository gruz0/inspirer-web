# frozen_string_literal: true

module Health
  module BodyWeights
    module Schemas
      BodyWeightSchema = Dry::Schema.Params do
        required(:attributes).hash do
          required(:weight).filled(Types::Coercible::FloatWithComma) { gt?(0) }
          required(:unit).filled(Types::WeightUnit)
          required(:feeling).filled(Types::Feeling)
          optional(:notes).value(Types::StrippedString)
          optional(:created_at).maybe(Types::Params::DateTime)
        end
      end
    end
  end
end
