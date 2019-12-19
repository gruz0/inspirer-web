# frozen_string_literal: true

module Health
  module BodyWeights
    module Operations
      class AssignAttributes < BaseOperation
        include Shared::Utils::Import['sanitizer']

        def call(input)
          resource, attributes = input.values_at(:resource, :attributes)

          attributes[:weight] = attributes[:weight].floor(1)
          attributes[:notes]  = sanitizer.sanitize_html(attributes[:notes])

          resource.assign_attributes(attributes)

          Success input.merge(resource: resource)
        end
      end
    end
  end
end
