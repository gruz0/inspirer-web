# frozen_string_literal: true

module Health
  module BodyWeights
    module Contracts
      class BodyWeightContract < Dry::Validation::Contract
        params do
          required(:attributes).hash do
            required(:weight).filled
            required(:unit).value(included_in?: WEIGHT_UNITS.keys.map(&:to_s)).filled
            required(:feeling).value(included_in?: FEELINGS.keys.map(&:to_s)).filled
            optional(:notes).value(:string)
          end
        end

        rule('attributes.weight') do
          key.failure('weight must be a number') if value.to_s.tr(',', '.').to_f <= 0.0
        end
      end
    end
  end
end
