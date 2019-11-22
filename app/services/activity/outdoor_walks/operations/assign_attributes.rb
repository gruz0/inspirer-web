# frozen_string_literal: true

module Activity
  module OutdoorWalks
    module Operations
      class AssignAttributes < BaseOperation
        def call(input)
          resource, attributes = input.values_at(:resource, :attributes)

          attributes[:distance] = attributes[:distance].floor(1)

          resource.assign_attributes(attributes)

          Success input.merge(resource: resource)
        end
      end
    end
  end
end
