# frozen_string_literal: true

module My
  module Activity
    class RunningsController < BaseController
      include Import[service: 'activity.runnings.service']

      def index
        super
      end

      def show
        super
      end

      def new
        super
      end

      def create
        super { my_activity_runnings_path }
      end

      def edit
        super
      end

      def update
        super { my_activity_runnings_path }
      end

      private

      def resource_params
        params.require(:activity_running).permit(:distance_unit, :distance, :feeling, :notes).to_h.symbolize_keys
      end

      def resource_class
        current_account.activity_running
      end
    end
  end
end
