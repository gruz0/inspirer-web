# frozen_string_literal: true

module Activity
  module CustomWorkouts
    module Operations
      class AssignAttributes < BaseOperation
        include Shared::Utils::Import['normalizer', 'sanitizer']

        def call(input)
          resource, attributes = input.values_at(:resource, :attributes)

          attributes[:title] = normalizer.remove_extra_whitespaces(attributes[:title])
          attributes[:notes] = sanitizer.sanitize_html(attributes[:notes])

          resource.assign_attributes(attributes)

          Success input.merge(resource: resource)
        end
      end
    end
  end
end
