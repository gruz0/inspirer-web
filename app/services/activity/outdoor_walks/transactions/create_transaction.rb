# frozen_string_literal: true

module Activity
  module OutdoorWalks
    module Transactions
      class CreateTransaction < BaseTransaction
        step :must_be_created_once_per_day, with: 'shared.must_be_created_once_per_day'
        step :validate, with: 'shared.validate'
        step :build, with: 'shared.build'
        step :assign_attributes, with: 'assign_attributes'
        step :persist, with: 'shared.persist'
      end
    end
  end
end
