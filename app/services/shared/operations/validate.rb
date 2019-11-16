# frozen_string_literal: true

require 'dry/monads/all'

module Shared
  module Operations
    class Validate
      include Dry::Monads

      def call(input, contract)
        result = contract.new.call(input)

        if result.success?
          Success input.merge(attributes: result[:attributes])
        else
          error_handler(result)
        end
      end

      private

      def error_handler(result)
        errors = result.errors(full: true)
        messages = collect_values(errors).flatten

        Failure messages
      end

      def collect_values(hash)
        hash.map { |value| value.is_a?(Hash) ? collect_values(value) : value }
      end
    end
  end
end
