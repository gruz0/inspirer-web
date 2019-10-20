# frozen_string_literal: true

module My
  module Health
    class BodyMeasuresController < BaseController
      include Import['find_by_created_today']

      def index
        @body_measures = current_account.health_body_measure.order(created_at: :desc)
      end

      def new
        created_today = find_by_created_today.call(current_account.health_body_measure)
        if created_today
          redirect_to edit_my_health_body_measure_path(created_today)
        else
          @body_measure = current_account.health_body_measure.new
        end
      end

      def create
        @body_measure = current_account.health_body_measure.new(body_measure_params)

        if @body_measure.save
          redirect_to my_health_body_measures_path, notice: 'Record was successfully created'
        else
          render :new
        end
      end

      def edit
        @body_measure = resource
      end

      def update
        @body_measure = resource
        if @body_measure.update(body_measure_params)
          redirect_to my_health_body_measures_path, notice: 'Record was successfully updated'
        else
          render :edit
        end
      end

      private

      def body_measure_params
        params.require(:health_body_measure).permit(:chest, :waist, :hips, :unit, :feeling, :notes)
      end

      def resource
        current_account.health_body_measure.find(params[:id])
      end
    end
  end
end
