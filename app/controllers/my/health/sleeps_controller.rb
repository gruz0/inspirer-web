# frozen_string_literal: true

module My
  module Health
    class SleepsController < BaseController
      include Import['find_by_created_today', service: 'health.sleeps.service']

      def index
        super
      end

      def show
        super
      end

      def new
        # rubocop:disable Rails/DynamicFindBy
        created_today = find_by_created_today.call(resource)
        # rubocop:enable Rails/DynamicFindBy
        if created_today
          redirect_to edit_my_health_sleep_path(created_today)
        else
          @record = resource.new
        end
      end

      def create
        super { my_health_sleeps_path }
      end

      def edit
        super
      end

      def update
        super { my_health_sleeps_path }
      end

      private

      def resource_params
        params.require(:health_sleep)
              .permit(:woke_up_at_hour, :woke_up_at_minutes, :feeling, :notes)
              .to_h.symbolize_keys
      end

      def resource_class
        current_account.health_sleep
      end
    end
  end
end
