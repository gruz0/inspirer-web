# frozen_string_literal: true

module My
  module Health
    class BodyWeightsController < BaseController
      include Import['find_by_created_today', service: 'health.body_weights.service']

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
        result = service.create(resource: resource, attributes: body_weight_params)

        if result.success?
          redirect_to my_health_body_weights_path, notice: 'Record was successfully created'
        else
          @errors, attributes = result.failure.values_at(:errors, :attributes)
          @body_weight = current_account.health_body_weight.new(attributes)
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
        params.require(:health_body_weight).permit(:weight, :unit, :feeling, :notes).to_h.symbolize_keys
      end

      def resource
        if params[:id]
          current_account.health_body_weight.find(params[:id])
        else
          current_account.health_body_weight.new
        end
      end
    end
  end
end
