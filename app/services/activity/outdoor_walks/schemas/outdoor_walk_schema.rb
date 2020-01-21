# frozen_string_literal: true

module Activity
  module OutdoorWalks
    module Schemas
      OutdoorWalkSchema = Dry::Schema.Params do
        required(:attributes).hash do
          required(:distance).filled(Types::Coercible::FloatWithComma) { gt?(0) }
          required(:steps).filled(:integer) { gt?(0) }
          required(:distance_unit).filled(Types::DistanceUnit)
          required(:feeling).filled(Types::Feeling)
          optional(:notes).value(Types::StrippedString)
          optional(:created_at).maybe(Types::Params::DateTime)
        end
      end
    end
  end
end
