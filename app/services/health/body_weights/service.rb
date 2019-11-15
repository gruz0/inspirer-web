# frozen_string_literal: true

module Health
  module BodyWeights
    class Service < BaseService
      def self.transactions
        {
          create: Transactions::CreateTransaction
        }
      end
    end
  end
end
