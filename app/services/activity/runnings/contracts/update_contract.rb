# frozen_string_literal: true

module Activity
  module Runnings
    module Contracts
      class UpdateContract < Dry::Validation::Contract
        schema(Schemas::RunningSchema)
      end
    end
  end
end
