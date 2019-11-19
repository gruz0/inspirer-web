# frozen_string_literal: true

module Health
  module BodyMeasures
    module Operations
      class BaseOperation
        def self.inherited(klass)
          klass.send :include, Dry::Transaction::Operation
        end

        def call(input)
          super(input)
        end
      end
    end
  end
end
