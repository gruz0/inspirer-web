# frozen_string_literal: true

require 'dry/transaction'
require 'dry/transaction/operation'

class BaseService
  include Dry::Transaction
  include Dry::Transaction::Operation

  private

  def error_handler(input)
    attributes, validation = input.values_at(:attributes, :validation)

    result = {
      attributes: attributes,
      errors: collect_values(validation.errors(full: true)).flatten
    }

    Failure result
  end

  def collect_values(hash)
    hash.map { |value| value.is_a?(Hash) ? collect_values(value) : value.to_s }
  end
end
