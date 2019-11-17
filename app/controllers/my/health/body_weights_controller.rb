# frozen_string_literal: true

module My
  module Health
    class BodyWeightsController < BaseController
      ACTION_MAP = {
        create: :create,
        update: :update
      }.freeze

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
        if result.success?
          redirect_to my_health_body_weights_path, notice: 'Record was successfully created'
        else
          @errors = result.failure
          @body_weight = current_account.health_body_weight.new(body_weight_params)
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
          @body_weight = current_account.health_body_weight.new(body_weight_params)
          render :edit
        end
      end

      private

      def result
        @result ||= service.send(action, resource: resource, attributes: body_weight_params)
      end

      def action
        ACTION_MAP[params[:action].to_sym]
      end

      def body_weight_params
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
