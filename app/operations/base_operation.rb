# frozen_string_literal: true

class BaseOperation
  def self.inherited(klass)
    klass.send :include, Dry::Transaction::Operation
  end
end
