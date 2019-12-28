# frozen_string_literal: true

module Activity
  module Yoga
    module Asanas
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
end
