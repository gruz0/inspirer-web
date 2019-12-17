# frozen_string_literal: true

module Learning
  module Articles
    module Operations
      class AssignAttributes < BaseOperation
        include Shared::Utils::Import['normalizer', 'sanitizer']

        def call(input)
          resource, attributes = input.values_at(:resource, :attributes)

          attributes[:url]   = normalizer.normalize_url(attributes[:url])
          attributes[:title] = normalizer.normalize_title(attributes[:title])
          attributes[:notes] = sanitizer.sanitize_html(attributes[:notes])

          resource.assign_attributes(attributes)

          Success input.merge(resource: resource)
        end
      end
    end
  end
end
