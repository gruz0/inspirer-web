# frozen_string_literal: true

module My
  module Health
    class BodyWeightsController < BaseController
      def index
        @body_weights = current_account.health_body_weight.order(created_at: :desc)
      end

      def new; end
    end
  end
end
