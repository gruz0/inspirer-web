# frozen_string_literal: true

module My
  module Activity
    class WalkingController < BaseController
      def index
        @walkings = current_account.activity_walking.order(created_at: :desc)
      end
    end
  end
end
