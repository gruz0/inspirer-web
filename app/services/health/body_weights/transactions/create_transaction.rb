# frozen_string_literal: true

module Health
  module BodyWeights
    module Transactions
      class CreateTransaction < BaseTransaction
        step :validate, with: 'shared.validate'
        step :build, with: 'build'
        step :assign_attributes, with: 'assign_attributes'
        step :persist, with: 'persist'
      end
    end
  end
end
