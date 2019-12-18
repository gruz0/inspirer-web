# frozen_string_literal: true

require 'dry/transaction/operation'

class BaseOperation
  def self.inherited(klass)
    klass.send :include, Dry::Transaction::Operation
  end
end
