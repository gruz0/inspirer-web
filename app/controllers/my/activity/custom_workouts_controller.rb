# frozen_string_literal: true

module My
  module Activity
    class CustomWorkoutsController < BaseController
      def index
        @custom_workouts = current_account.activity_custom_workout.order(created_at: :desc)
      end

      def new
        @custom_workout = current_account.activity_custom_workout.new
      end

      def create
        @custom_workout = current_account.activity_custom_workout.new(custom_workout_params)

        if @custom_workout.save
          redirect_to my_activity_custom_workouts_path, notice: 'Record was successfully created'
        else
          render :new
        end
      end

      def edit
        @custom_workout = resource
      end

      def update
        @custom_workout = resource
        if @custom_workout.update(custom_workout_params)
          redirect_to my_activity_custom_workouts_path, notice: 'Record was successfully updated'
        else
          render :edit
        end
      end

      private

      def custom_workout_params
        params.require(:activity_custom_workout).permit(:title, :notes, :feeling)
      end

      def resource
        current_account.activity_custom_workout.find(params[:id])
      end
    end
  end
end
