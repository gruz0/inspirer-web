# frozen_string_literal: true

module Health
  module Sleeps
    module Operations
      class AssignAttributes < BaseOperation
        include Shared::Utils::Import['html_sanitizer']

        def call(input)
          resource, attributes = input.values_at(:resource, :attributes)

          attributes[:notes] = html_sanitizer.call(attributes[:notes])

          resource.assign_attributes(attributes)

          Success input.merge(resource: resource)
        end
      end
    end
  end
end
