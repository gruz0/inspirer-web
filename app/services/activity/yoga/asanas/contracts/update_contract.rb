# frozen_string_literal: true

module Activity
  module Yoga
    module Asanas
      module Contracts
        class UpdateContract < Dry::Validation::Contract
          schema(Schemas::AsanaSchema)
        end
      end
    end
  end
end
