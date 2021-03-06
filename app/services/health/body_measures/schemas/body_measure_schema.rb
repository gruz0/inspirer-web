# frozen_string_literal: true

module Health
  module BodyMeasures
    module Schemas
      BodyMeasureSchema = Dry::Schema.Params do
        required(:attributes).hash do
          required(:chest).filled(Types::Coercible::FloatWithComma) { gt?(0) }
          required(:hips).filled(Types::Coercible::FloatWithComma) { gt?(0) }
          required(:waist).filled(Types::Coercible::FloatWithComma) { gt?(0) }
          required(:unit).filled.value(included_in?: BODY_MEASURE_UNITS.keys.map(&:to_s))
          required(:feeling).filled(Types::Feeling)
          optional(:notes).value(Types::StrippedString)
          optional(:created_at).maybe(Types::Params::DateTime)
        end
      end
    end
  end
end
