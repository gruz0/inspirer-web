# frozen_string_literal: true

require 'dry/monads/all'

module Shared
  module Operations
    class CheckURLUniqueness < BaseOperation
      include Dry::Monads

      def call(input)
        resource, attributes = input.values_at(:resource, :attributes)

        record = resource.class.find_by('url = ?', attributes[:url])
        if record && record.id != resource.id
          Failure ['URL has already been taken']
        else
          Success input
        end
      end
    end
  end
end
