# frozen_string_literal: true

module My
  module Health
    class BodyWeightsController < BaseController
      include Import['find_by_created_today', service: 'health.body_weights.service']

      def index
        @body_weights = resource.order(created_at: :desc)
      end

      def new
        # rubocop:disable Rails/DynamicFindBy
        created_today = find_by_created_today.call(resource)
        # rubocop:enable Rails/DynamicFindBy
        if created_today
          redirect_to edit_my_health_body_weight_path(created_today)
        else
          @body_weight = resource.new
        end
      end

      def create
        if result.success?
          redirect_to my_health_body_weights_path, notice: 'Record was successfully created'
        else
          @errors = result.failure
          @body_weight = resource.new(resource_params)
          render :new
        end
      end

      def edit
        @body_weight = resource
      end

      def update
        if result.success?
          redirect_to my_health_body_weights_path, notice: 'Record was successfully updated'
        else
          @errors = result.failure
          @body_weight = resource.new(resource_params)
          render :edit
        end
      end

      private

      def resource_params
        params.require(:health_body_weight).permit(:weight, :unit, :feeling, :notes).to_h.symbolize_keys
      end

      def resource
        if params[:id]
          current_account.health_body_weight.find(params[:id])
        else
          current_account.health_body_weight
        end
      end
    end
  end
end
