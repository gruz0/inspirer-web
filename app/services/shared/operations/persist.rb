# frozen_string_literal: true

require 'dry/monads/all'

module Shared
  module Operations
    class Persist
      include Dry::Monads

      def call(input)
        resource, attributes = input.values_at(:resource, :attributes)

        resource.save!

        Success input.merge(resource: resource)
      rescue ActiveRecord::RecordInvalid => e
        Failure attributes: attributes, errors: [e.message]
      end
    end
  end
end
