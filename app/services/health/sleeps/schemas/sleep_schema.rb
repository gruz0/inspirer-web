# frozen_string_literal: true

module Health
  module Sleeps
    module Schemas
      SleepSchema = Dry::Schema.Params do
        required(:attributes).hash do
          required(:woke_up_at_hour).filled(:integer) { gteq?(0) & lt?(24) }
          required(:woke_up_at_minutes).filled(:integer) { gteq?(0) & lt?(60) }
          required(:feeling).filled(Types::Feeling)
          optional(:notes).value(Types::StrippedString)
          optional(:created_at).maybe(Types::Params::DateTime)
        end
      end
    end
  end
end
