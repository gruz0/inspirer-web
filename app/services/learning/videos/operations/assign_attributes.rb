# frozen_string_literal: true

module Learning
  module Videos
    module Operations
      class AssignAttributes < BaseOperation
        include Shared::Utils::Import['normalizer', 'sanitizer']

        def call(input)
          resource, attributes = input.values_at(:resource, :attributes)

          attributes[:url]   = normalizer.normalize_url(attributes[:url])
          attributes[:title] = normalizer.remove_extra_whitespaces(attributes[:title])
          attributes[:notes] = sanitizer.sanitize_html(attributes[:notes])

          attributes.delete(:created_at) if attributes[:created_at].blank?

          resource.assign_attributes(attributes)

          Success input.merge(resource: resource)
        end
      end
    end
  end
end
