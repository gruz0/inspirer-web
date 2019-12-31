# frozen_string_literal: true

module My
  module Activity
    class CustomWorkoutsController < BaseController
      include Import[service: 'activity.custom_workouts.service']

      def index
        @records = resource.order(created_at: :desc)
      end

      def new
        @record = resource.new
      end

      def create
        if result.success?
          redirect_to my_activity_custom_workouts_path, notice: 'Record was successfully created'
        else
          @errors = result.failure
          @record = resource_class.new(resource_params)
          render :new
        end
      end

      def edit
        @record = resource
      end

      def update
        if result.success?
          redirect_to my_activity_custom_workouts_path, notice: 'Record was successfully updated'
        else
          @errors = result.failure
          @record = resource_class.new(resource_params)
          render :edit
        end
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
