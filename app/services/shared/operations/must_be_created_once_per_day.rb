# frozen_string_literal: true

require 'dry/monads/all'

module Shared
  module Operations
    class MustBeCreatedOncePerDay
      include Dry::Monads
      include Import[service: 'find_by_created_today']

      def call(input)
        if service.call(input[:resource])
          Failure ['Record for this day already exists']
        else
          Success input
        end
      end
    end
  end
end
