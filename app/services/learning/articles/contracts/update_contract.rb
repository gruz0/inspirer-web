# frozen_string_literal: true

module Learning
  module Articles
    module Contracts
      class UpdateContract < Dry::Validation::Contract
        schema(Schemas::ArticleSchema)

        rule(%i[attributes url]).validate(:url_format)
      end
    end
  end
end
