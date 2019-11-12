# frozen_string_literal: true

module Health
  module BodyWeights
    class CreateService < BaseService
      include Import[contract: 'health.body_weights.contracts.body_weight_contract']

      step :validate
      step :build
      step :assign_attributes
      step :persist

      private

      def validate(input)
        validation = contract.call(input)

        if validation.success?
          Success input
        else
          error_handler(attributes: input[:attributes], validation: validation)
        end
      end

      def build(input)
        resource = input[:resource].new(input[:attributes])

        Success input.merge(resource: resource)
      end

      def assign_attributes(input)
        resource, attributes = input.values_at(:resource, :attributes)

        attributes[:weight] = attributes[:weight].to_s.tr(',', '.').to_f

        resource.assign_attributes(attributes)

        Success input.merge(resource: resource)
      end

      def persist(input)
        resource, attributes = input.values_at(:resource, :attributes)

        resource.save!(attributes)

        Success input.merge(resource: resource)
      rescue ActiveRecord::RecordInvalid => e
        Failure attributes: attributes, errors: [e.message]
      end
    end
  end
end
