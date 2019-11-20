# frozen_string_literal: true

module Activity
  module OutdoorWalks
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
