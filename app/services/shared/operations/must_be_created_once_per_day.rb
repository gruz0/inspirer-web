# frozen_string_literal: true

require 'dry/monads/all'

module Shared
  module Operations
    class MustBeCreatedOncePerDay
      include Dry::Monads

      def call(input)
        if HealthBodyWeight.exists?(account: input[:resource].account, created_date: Date.current)
          Failure ['Record for this day already exists']
        else
          Success input
        end
      end
    end
  end
end
