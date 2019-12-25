# frozen_string_literal: true

module Learning
  module Books
    module Transactions
      class CreateTransaction < BaseTransaction
        step :validate, with: 'shared.validate'
        step :build, with: 'shared.build'
        step :assign_attributes, with: 'assign_attributes'
        step :persist, with: 'shared.persist'
      end
    end
  end
end
