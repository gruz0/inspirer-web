# frozen_string_literal: true

module My
  module Activity
    class CustomWorkoutsController < BaseController
      include Import[service: 'activity.custom_workouts.service']

      def index
        @custom_workouts = resource.order(created_at: :desc)
      end

      def new
        @custom_workout = resource.new
      end

      def create
        if result.success?
          redirect_to my_activity_custom_workouts_path, notice: 'Record was successfully created'
        else
          @errors = result.failure
          @custom_workout = resource.new(resource_params)
          render :new
        end
      end

      def edit
        @custom_workout = resource
      end

      def update
        if result.success?
          redirect_to my_activity_custom_workouts_path, notice: 'Record was successfully updated'
        else
          @errors = result.failure
          @custom_workout = resource.new(resource_params)
          render :edit
        end
      end

      private

      def resource_params
        params.require(:activity_custom_workout).permit(:title, :notes, :feeling).to_h.symbolize_keys
      end

      def resource
        if params[:id]
          current_account.activity_custom_workout.find(params[:id])
        else
          current_account.activity_custom_workout
        end
      end
    end
  end
end
