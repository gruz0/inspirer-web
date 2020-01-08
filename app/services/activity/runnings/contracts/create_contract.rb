# frozen_string_literal: true

module Activity
  module Runnings
    module Contracts
      class CreateContract < Dry::Validation::Contract
        schema(Schemas::RunningSchema)
      end
    end
  end
end
