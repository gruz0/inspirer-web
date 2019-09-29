# frozen_string_literal: true

module My
  module Health
    class BodyWeightsController < BaseController
      def index
        @body_weights = current_account.health_body_weight.order(created_at: :desc)
      end

      def new
        @body_weight = current_account.health_body_weight.new
      end

      def create
        @body_weight = current_account.health_body_weight.new(body_weight_params)

        if @body_weight.save
          redirect_to my_health_body_weights_path, notice: 'Record was successfully created'
        else
          render :new
        end
      end

      private

      def body_weight_params
        params.require(:health_body_weight).permit(:weight, :unit, :feeling, :notes)
      end
    end
  end
end
