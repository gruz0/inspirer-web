# frozen_string_literal: true

module Activity
  module Running
    module Contracts
      class UpdateContract < Dry::Validation::Contract
        schema(Schemas::RunningSchema)
      end
    end
  end
end
