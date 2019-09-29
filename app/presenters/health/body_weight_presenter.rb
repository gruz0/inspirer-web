# frozen_string_literal: true

module Health
  class BodyWeightPresenter
    attr_reader :body_weight

    def initialize(body_weight)
      @body_weight = body_weight
    end

    def weight
      body_weight.weight.round(2)
    end
  end
end
