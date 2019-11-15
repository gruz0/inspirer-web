# frozen_string_literal: true

module Health
  module BodyWeights
    module Operations
      class Build < BaseOperation
        def call(input)
          resource = input[:resource].new(input[:attributes])

          Success input.merge(resource: resource)
        end
      end
    end
  end
end
