# frozen_string_literal: true

require 'dry/monads/all'

module Shared
  module Operations
    class MustBeCreatedOncePerDay
      include Dry::Monads
      include Import[service: 'find_for_specific_day']

      def call(input)
        resource, attributes = input.values_at(:resource, :attributes)

        existed_record = service.call(resource, attributes[:created_at])

        if existed_record && existed_record.id != resource.id
          Failure ['Record for this day already exists']
        else
          Success input
        end
      end
    end
  end
end
