# frozen_string_literal: true

module My
  module Health
    class BodyMeasuresController < BaseController
      include Import['find_for_specific_day', service: 'health.body_measures.service']

      def index
        super
      end

      def show
        super
      end

      def new
        created_today = find_for_specific_day.call(resource.new, Date.current)
        if created_today
          redirect_to edit_my_health_body_measure_path(created_today)
        else
          @record = resource.new
        end
      end

      def create
        super { my_health_body_measures_path }
      end

      def edit
        super
      end

      def update
        super { my_health_body_measures_path }
      end

      private

      def resource_params
        params.require(:health_body_measure)
              .permit(:chest, :waist, :hips, :unit, :feeling, :notes, :created_at)
              .to_h.symbolize_keys
      end

      def resource_class
        current_account.health_body_measure
      end
    end
  end
end
