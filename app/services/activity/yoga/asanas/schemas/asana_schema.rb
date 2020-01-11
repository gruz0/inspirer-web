# frozen_string_literal: true

module Activity
  module Yoga
    module Asanas
      module Schemas
        AsanaSchema = Dry::Schema.Params do
          required(:attributes).hash do
            required(:notes).filled(Types::StrippedString)
            required(:feeling).filled(Types::Feeling)
          end
        end
      end
    end
  end
end
