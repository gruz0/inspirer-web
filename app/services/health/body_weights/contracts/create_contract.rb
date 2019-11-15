# frozen_string_literal: true

module Health
  module BodyWeights
    module Contracts
      class CreateContract < Dry::Validation::Contract
        schema(Schemas::BodyWeightSchema)
      end
    end
  end
end
