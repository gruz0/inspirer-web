# frozen_string_literal: true

module Health
  module Meditations
    module Transactions
      class BaseTransaction
        def self.inherited(klass)
          klass.send :include, Dry::Transaction(container: Operations::Container)
        end

        def call(input)
          super(input)
        end
      end
    end
  end
end
