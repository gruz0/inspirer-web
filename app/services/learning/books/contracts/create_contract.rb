# frozen_string_literal: true

module Learning
  module Books
    module Contracts
      class CreateContract < Dry::Validation::Contract
        schema(Schemas::BookSchema)

        rule(%i[attributes url]).validate(url_format: :allow_empty)
      end
    end
  end
end
