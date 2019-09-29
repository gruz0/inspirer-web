# frozen_string_literal: true

module My
  module Health
    class BodyMeasuresController < BaseController
      def index
        @body_measures = current_account.health_body_measure.order(created_at: :desc)
      end

      def new
        @body_measure = current_account.health_body_measure.new
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
