# frozen_string_literal: true

module Health
  module Meditations
    class Service < BaseService
      def self.transactions
        {
          create: Transactions::CreateTransaction,
          update: Transactions::UpdateTransaction
        }
      end
    end
  end
end
