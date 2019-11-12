# frozen_string_literal: true

module Health
  module BodyWeights
    class Service
      include Dry::Monads
      include Import['health.body_weights.create_service']

      def create(input)
        create_service.call(input)
      end
    end
  end
end
