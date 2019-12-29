# frozen_string_literal: true

module My
  module Health
    class SleepsController < BaseController
      include Import['find_by_created_today', service: 'health.sleeps.service']

      def index
        @sleeps = resource.order(created_at: :desc)
      end

      def new
        # rubocop:disable Rails/DynamicFindBy
        created_today = find_by_created_today.call(resource)
        # rubocop:enable Rails/DynamicFindBy
        if created_today
          redirect_to edit_my_health_sleep_path(created_today)
        else
          @sleep = resource.new
        end
      end

      def create
        if result.success?
          redirect_to my_health_sleeps_path, notice: 'Record was successfully created'
        else
          @errors = result.failure
          @sleep = resource.new(resource_params)
          render :new
        end
      end

      def edit
        @sleep = resource
      end

      def update
        if result.success?
          redirect_to my_health_sleeps_path, notice: 'Record was successfully updated'
        else
          @errors = result.failure
          @sleep = resource.new(resource_params)
          render :edit
        end
      end

      private

      def result
        @result ||= service.send(action, resource: resource, attributes: resource_params)
      end

      def resource_params
        params.require(:health_sleep)
              .permit(:woke_up_at_hour, :woke_up_at_minutes, :feeling, :notes)
              .to_h.symbolize_keys
      end

      def resource
        if params[:id]
          current_account.health_sleep.find(params[:id])
        else
          current_account.health_sleep
        end
      end
    end
  end
end
