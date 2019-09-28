# frozen_string_literal: true

module My
  module Health
    class SleepsController < BaseController
      def index; end

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

      private

      def post_params
        params.require(:health_sleep).permit(:woke_up_at_hour, :woke_up_at_minutes, :feeling, :notes)
      end
    end
  end
end
