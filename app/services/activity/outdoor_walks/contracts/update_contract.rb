# frozen_string_literal: true

module Activity
  module OutdoorWalks
    module Contracts
      class UpdateContract < Dry::Validation::Contract
        schema(Schemas::OutdoorWalkSchema)
      end
    end
  end
end
