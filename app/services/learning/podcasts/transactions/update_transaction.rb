# frozen_string_literal: true

module Learning
  module Podcasts
    module Transactions
      class UpdateTransaction < BaseTransaction
        step :validate, with: 'shared.validate'
        step :check_url_uniqueness, with: 'shared.check_url_uniqueness'
        step :assign_attributes, with: 'assign_attributes'
        step :persist, with: 'shared.persist'
      end
    end
  end
end
