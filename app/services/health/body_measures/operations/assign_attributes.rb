# frozen_string_literal: true

module Health
  module BodyMeasures
    module Operations
      class AssignAttributes < BaseOperation
        def call(input)
          resource, attributes = input.values_at(:resource, :attributes)

          precision = attributes[:unit] == 'inch' ? 2 : 1
          attributes[:chest] = attributes[:chest].floor(precision)
          attributes[:waist] = attributes[:waist].floor(precision)
          attributes[:hips] = attributes[:hips].floor(precision)

          resource.assign_attributes(attributes)

          Success input.merge(resource: resource)
        end
      end
    end
  end
end
