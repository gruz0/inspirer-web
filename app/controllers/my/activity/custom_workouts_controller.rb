# frozen_string_literal: true

module My
  module Activity
    class CustomWorkoutsController < BaseController
      include Import[service: 'activity.custom_workouts.service']

      def index
        super
      end

      def new
        super
      end

      def create
        super { my_activity_custom_workouts_path }
      end

      def edit
        super
      end

      def update
        super { my_activity_custom_workouts_path }
      end

      private

      def resource_params
        params.require(:activity_custom_workout).permit(:title, :notes, :feeling).to_h.symbolize_keys
      end

      def resource_class
        current_account.activity_custom_workout
      end
    end
  end
end
