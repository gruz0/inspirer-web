# frozen_string_literal: true

module Activity
  module CustomWorkouts
    module Contracts
      class UpdateContract < Dry::Validation::Contract
        schema(Schemas::CustomWorkoutSchema)
      end
    end
  end
end
