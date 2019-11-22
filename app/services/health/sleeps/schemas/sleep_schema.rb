# frozen_string_literal: true

module Health
  module Sleeps
    module Schemas
      SleepSchema = Dry::Schema.Params do
        required(:attributes).hash do
          required(:woke_up_at_hour).filled(Types::Coercible::Integer) { gteq?(0) & lt?(24) }
          required(:woke_up_at_minutes).filled(Types::Coercible::Integer) { gteq?(0) & lt?(60) }
          required(:feeling).filled.value(included_in?: FEELINGS.keys.map(&:to_s))
          optional(:notes).value(Types::Coercible::SanitizedHTML)
        end
      end
    end
  end
end