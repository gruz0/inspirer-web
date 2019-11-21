# frozen_string_literal: true

module Health
  module BodyWeights
    module Operations
      class AssignAttributes < BaseOperation
        def call(input)
          resource, attributes = input.values_at(:resource, :attributes)

          attributes[:weight] = attributes[:weight].floor(1)

          resource.assign_attributes(attributes)

          Success input.merge(resource: resource)
        end
      end
    end
  end
end
