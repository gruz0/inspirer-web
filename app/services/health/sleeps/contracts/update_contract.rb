# frozen_string_literal: true

module Health
  module Sleeps
    module Contracts
      class UpdateContract < Dry::Validation::Contract
        schema(Schemas::SleepSchema)
      end
    end
  end
end
