# frozen_string_literal: true

module Activity
  module CustomWorkouts
    module Contracts
      class CreateContract < Dry::Validation::Contract
        schema(Schemas::CustomWorkoutSchema)
      end
    end
  end
end
