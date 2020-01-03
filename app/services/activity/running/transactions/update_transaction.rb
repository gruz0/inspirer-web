# frozen_string_literal: true

module Activity
  module Running
    module Transactions
      class UpdateTransaction < BaseTransaction
        step :validate, with: 'shared.validate'
        step :assign_attributes, with: 'assign_attributes'
        step :persist, with: 'shared.persist'
      end
    end
  end
end
