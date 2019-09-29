# frozen_string_literal: true

module My
  module Health
    class BodyMeasuresController < BaseController
      def index
        @body_measures = current_account.health_body_measure.order(created_at: :desc)
      end

      def new; end
    end
  end
end
