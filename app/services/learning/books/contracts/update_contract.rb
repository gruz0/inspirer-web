# frozen_string_literal: true

module Learning
  module Books
    module Contracts
      class UpdateContract < Dry::Validation::Contract
        schema(Schemas::BookSchema)

        rule(%i[attributes url]).validate(:url_format)
      end
    end
  end
end
