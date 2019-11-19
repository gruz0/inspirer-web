# frozen_string_literal: true

module Health
  module BodyMeasures
    module Contracts
      class CreateContract < Dry::Validation::Contract
        schema(Schemas::BodyMeasureSchema)
      end
    end
  end
end
