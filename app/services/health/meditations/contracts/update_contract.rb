# frozen_string_literal: true

module Health
  module Meditations
    module Contracts
      class UpdateContract < Dry::Validation::Contract
        schema(Schemas::MeditationSchema)
      end
    end
  end
end
