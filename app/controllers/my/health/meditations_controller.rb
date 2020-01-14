# frozen_string_literal: true

module My
  module Health
    class MeditationsController < BaseController
      include Import[service: 'health.meditations.service']

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
        super { my_health_meditations_path }
      end

      def edit
        super
      end

      def update
        super { my_health_meditations_path }
      end

      private

      def resource_params
        params.require(:health_meditation).permit(:notes, :feeling).to_h.symbolize_keys
      end

      def resource_class
        current_account.health_meditation
      end
    end
  end
end
