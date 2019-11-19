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
          required(:feeling).filled.value(included_in?: FEELINGS.keys.map(&:to_s))
          optional(:notes).value(:string)
        end
      end
    end
  end
end
