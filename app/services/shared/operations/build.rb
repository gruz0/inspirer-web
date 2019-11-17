# frozen_string_literal: true

require 'dry/monads/all'

module Shared
  module Operations
    class Build
      include Dry::Monads

      def call(input)
        resource = input[:resource].new(input[:attributes])

        Success input.merge(resource: resource)
      end
    end
  end
end
