# frozen_string_literal: true

module Health
  module Sleeps
    module Operations
      class AssignAttributes < BaseOperation
        include Shared::Utils::Import['sanitizer']

        def call(input)
          resource, attributes = input.values_at(:resource, :attributes)

          attributes[:notes] = sanitizer.sanitize_html(attributes[:notes])

          attributes.delete(:created_at) if attributes[:created_at].blank?

          resource.assign_attributes(attributes)

          Success input.merge(resource: resource)
        end
      end
    end
  end
end
