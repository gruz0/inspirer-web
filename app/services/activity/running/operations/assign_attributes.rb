# frozen_string_literal: true

module Activity
  module Running
    module Operations
      class AssignAttributes < BaseOperation
        include Shared::Utils::Import['sanitizer']

        def call(input)
          resource, attributes = input.values_at(:resource, :attributes)

          attributes[:distance] = attributes[:distance].floor(1)
          attributes[:notes]    = sanitizer.sanitize_html(attributes[:notes])

          resource.assign_attributes(attributes)

          Success input.merge(resource: resource)
        end
      end
    end
  end
end
