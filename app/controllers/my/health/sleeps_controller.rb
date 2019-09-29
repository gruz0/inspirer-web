# frozen_string_literal: true

module My
  module Health
    class SleepsController < BaseController
      def index
        @sleeps = current_account.health_sleep.order(created_at: :desc)
      end

      def new
        @sleep = HealthSleep.new
      end

      def create
        @sleep = current_account.health_sleep.new(post_params)

        if @sleep.save
          redirect_to my_health_sleeps_path, notice: 'Record was successfully created'
        else
          render :new
        end
      end

      def edit
        @sleep = resource
      end

      def update
        @sleep = resource
        if @sleep.update(post_params)
          redirect_to my_health_sleeps_path, notice: 'Record was successfully updated'
        else
          render :edit
        end
      end

      private

      # FIXME: Rename to sleep_params
      def post_params
        params.require(:health_sleep).permit(:woke_up_at_hour, :woke_up_at_minutes, :feeling, :notes)
      end

      def resource
        current_account.health_sleep.find(params[:id])
      end
    end
  end
end
