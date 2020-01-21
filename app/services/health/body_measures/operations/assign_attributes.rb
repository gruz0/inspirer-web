# frozen_string_literal: true

module Health
  module BodyMeasures
    module Operations
      class AssignAttributes < BaseOperation
        include Shared::Utils::Import['sanitizer']

        def call(input)
          resource, attributes = input.values_at(:resource, :attributes)

          # FIXME: Extract calculation into service's utils
          precision = attributes[:unit] == 'inch' ? 2 : 1
          attributes[:chest] = attributes[:chest].floor(precision)
          attributes[:waist] = attributes[:waist].floor(precision)
          attributes[:hips]  = attributes[:hips].floor(precision)

          attributes[:notes] = sanitizer.sanitize_html(attributes[:notes])

          attributes.delete(:created_at) if attributes[:created_at].blank?

          resource.assign_attributes(attributes)

          Success input.merge(resource: resource)
        end
      end
    end
  end
end
