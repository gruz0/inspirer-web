# frozen_string_literal: true

module My
  module Health
    class BodyWeightsController < BaseController
      include Import['find_by_created_today']

      def index
        @body_weights = current_account.health_body_weight.order(created_at: :desc)
      end

      def new
        # rubocop:disable Rails/DynamicFindBy
        created_today = find_by_created_today.call(current_account.health_body_weight)
        # rubocop:enable Rails/DynamicFindBy
        if created_today
          redirect_to edit_my_health_body_weight_path(created_today)
        else
          @body_weight = current_account.health_body_weight.new
        end
      end

      def create
        @body_weight = current_account.health_body_weight.new(body_weight_params)

        if @body_weight.save
          redirect_to my_health_body_weights_path, notice: 'Record was successfully created'
        else
          render :new
        end
      end

      def edit
        @body_weight = resource
      end

      def update
        @body_weight = resource
        if @body_weight.update(body_weight_params)
          redirect_to my_health_body_weights_path, notice: 'Record was successfully updated'
        else
          render :edit
        end
      end

      private

      def body_weight_params
        params.require(:health_body_weight).permit(:weight, :unit, :feeling, :notes)
      end

      def resource
        current_account.health_body_weight.find(params[:id])
      end
    end
  end
end
