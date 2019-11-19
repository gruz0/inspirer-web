# frozen_string_literal: true

module Activity
  module OutdoorWalks
    module Contracts
      class CreateContract < Dry::Validation::Contract
        schema(Schemas::OutdoorWalkSchema)
      end
    end
  end
end
