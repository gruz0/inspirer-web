# frozen_string_literal: true

module Learning
  module Articles
    module Transactions
      class UpdateTransaction < BaseTransaction
        step :validate, with: 'shared.validate'
        step :check_url_uniqueness, with: 'shared.check_url_uniqueness'
        step :assign_attributes, with: 'assign_attributes'
        step :persist, with: 'shared.persist'
        tee :fetch_link_title, with: 'shared.fetch_link_title'
      end
    end
  end
end
