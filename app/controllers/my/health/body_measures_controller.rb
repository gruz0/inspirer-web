# frozen_string_literal: true

module My
  module Health
    class BodyMeasuresController < BaseController
      ACTION_MAP = {
        create: :create,
        update: :update
      }.freeze

      include Import['find_by_created_today', service: 'health.body_measures.service']

      def index
        @body_measures = current_account.health_body_measure.order(created_at: :desc)
      end

      def new
        # rubocop:disable Rails/DynamicFindBy
        created_today = find_by_created_today.call(resource)
        # rubocop:enable Rails/DynamicFindBy
        if created_today
          redirect_to edit_my_health_body_measure_path(created_today)
        else
          @body_measure = current_account.health_body_measure.new
        end
      end

      def create
        if result.success?
          redirect_to my_health_body_measures_path, notice: 'Record was successfully created'
        else
          @errors = result.failure
          @body_measure = current_account.health_body_measure.new(body_measure_params)
          render :new
        end
      end

      def edit
        @body_measure = resource
      end

      def update
        if result.success?
          redirect_to my_health_body_measures_path, notice: 'Record was successfully updated'
        else
          @errors = result.failure
          @body_measure = current_account.health_body_measure.new(body_measure_params)
          render :edit
        end
      end

      private

      def result
        @result ||= service.send(action, resource: resource, attributes: body_measure_params)
      end

      def action
        ACTION_MAP[params[:action].to_sym]
      end

      def body_measure_params
        params.require(:health_body_measure).permit(:chest, :waist, :hips, :unit, :feeling, :notes).to_h.symbolize_keys
      end

      def resource
        if params[:id]
          current_account.health_body_measure.find(params[:id])
        else
          current_account.health_body_measure
        end
      end
    end
  end
end
