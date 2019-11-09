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

      private

      def custom_workout_params
        params.require(:activity_custom_workout).permit(:title, :notes, :feeling)
      end
    end
  end
end
