# frozen_string_literal: true

module Learning
  module Podcasts
    module Contracts
      class CreateContract < Dry::Validation::Contract
        schema(Schemas::PodcastSchema)

        rule(%i[attributes url]).validate(:url_format)
      end
    end
  end
end
