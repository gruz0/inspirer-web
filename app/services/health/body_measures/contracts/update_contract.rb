# frozen_string_literal: true

module Health
  module BodyMeasures
    module Contracts
      class UpdateContract < Dry::Validation::Contract
        schema(Schemas::BodyMeasureSchema)
      end
    end
  end
end
