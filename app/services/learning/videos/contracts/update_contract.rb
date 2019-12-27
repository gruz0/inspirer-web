# frozen_string_literal: true

module Learning
  module Videos
    module Contracts
      class UpdateContract < Dry::Validation::Contract
        schema(Schemas::VideoSchema)

        rule(%i[attributes url]).validate(:url_format)
      end
    end
  end
end
