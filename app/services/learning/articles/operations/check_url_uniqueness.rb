# frozen_string_literal: true

module Learning
  module Articles
    module Operations
      class CheckURLUniqueness < BaseOperation
        def call(input)
          resource, attributes = input.values_at(:resource, :attributes)

          if resource.class.find_by('url = ?', attributes[:url])
            Failure ['URL has already been taken']
          else
            Success input
          end
        end
      end
    end
  end
end
