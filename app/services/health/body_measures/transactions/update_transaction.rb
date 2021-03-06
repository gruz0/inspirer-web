# frozen_string_literal: true

module Health
  module BodyMeasures
    module Transactions
      class UpdateTransaction < BaseTransaction
        step :validate, with: 'shared.validate'
        step :must_be_created_once_per_day, with: 'shared.must_be_created_once_per_day'
        step :assign_attributes, with: 'assign_attributes'
        step :persist, with: 'shared.persist'
      end
    end
  end
end
