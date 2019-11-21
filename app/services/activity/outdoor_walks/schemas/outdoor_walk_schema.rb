# frozen_string_literal: true

module Activity
  module OutdoorWalks
    module Schemas
      OutdoorWalkSchema = Dry::Schema.Params do
        required(:attributes).hash do
          required(:distance).filled(Types::Coercible::FloatWithComma) { gt?(0) }
          required(:steps).filled(Types::Coercible::Integer) { gt?(0) }
          required(:distance_unit).filled.value(included_in?: DISTANCE_UNITS.keys.map(&:to_s))
          required(:feeling).filled.value(included_in?: FEELINGS.keys.map(&:to_s))
          optional(:notes).value(Types::Coercible::Notes)
        end
      end
    end
  end
end
