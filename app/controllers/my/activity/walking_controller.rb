# frozen_string_literal: true

module My
  module Activity
    class WalkingController < BaseController
      def index
        @walkings = current_account.activity_walking.order(created_at: :desc)
      end

      def new
        @walking = current_account.activity_walking.new
      end

      def create
        @walking = current_account.activity_walking.new(walking_params)

        if @walking.save
          redirect_to my_activity_walking_index_path, notice: 'Record was successfully created'
        else
          render :new
        end
      end

      private

      def walking_params
        params.require(:activity_walking).permit(:distance_unit, :distance, :steps, :feeling, :notes)
      end
    end
  end
end
