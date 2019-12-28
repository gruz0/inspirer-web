# frozen_string_literal: true

module Activity
  module Yoga
    module Asanas
      module Contracts
        class CreateContract < Dry::Validation::Contract
          schema(Schemas::AsanaSchema)
        end
      end
    end
  end
end
