# frozen_string_literal: true

module Health
  module BodyWeights
    module Operations
      class Persist < BaseOperation
        def call(input)
          resource, attributes = input.values_at(:resource, :attributes)

          resource.save!(attributes)

          Success input.merge(resource: resource)
        rescue ActiveRecord::RecordInvalid => e
          Failure attributes: attributes, errors: [e.message]
        end
      end
    end
  end
end
