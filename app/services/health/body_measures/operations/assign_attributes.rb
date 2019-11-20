# frozen_string_literal: true

module Health
  module BodyMeasures
    module Operations
      class AssignAttributes < BaseOperation
        include Shared::Utils::Import['html_sanitizer']

        def call(input)
          resource, attributes = input.values_at(:resource, :attributes)

          precision = attributes[:unit] == 'inch' ? 2 : 1
          attributes[:chest] = attributes[:chest].floor(precision)
          attributes[:waist] = attributes[:waist].floor(precision)
          attributes[:hips] = attributes[:hips].floor(precision)

          attributes[:notes] = html_sanitizer.call(attributes[:notes])

          resource.assign_attributes(attributes)

          Success input.merge(resource: resource)
        end
      end
    end
  end
end
