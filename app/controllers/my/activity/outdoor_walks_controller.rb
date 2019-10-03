# frozen_string_literal: true

module My
  module Activity
    class OutdoorWalksController < BaseController
      def index
        @outdoor_walks = current_account.activity_outdoor_walk.order(created_at: :desc)
      end

      def new
        created_today = FindByCreatedToday.call(current_account.activity_outdoor_walk)
        if created_today
          redirect_to edit_my_activity_outdoor_walk_path(created_today)
        else
          @outdoor_walk = current_account.activity_outdoor_walk.new
        end
      end

      def create
        @outdoor_walk = current_account.activity_outdoor_walk.new(outdoor_walk_params)

        if @outdoor_walk.save
          redirect_to my_activity_outdoor_walks_path, notice: 'Record was successfully created'
        else
          render :new
        end
      end

      def edit
        @outdoor_walk = resource
      end

      def update
        @outdoor_walk = resource
        if @outdoor_walk.update(outdoor_walk_params)
          redirect_to my_activity_outdoor_walks_path, notice: 'Record was successfully updated'
        else
          render :edit
        end
      end

      private

      def outdoor_walk_params
        params.require(:activity_outdoor_walk).permit(:distance_unit, :distance, :steps, :feeling, :notes)
      end

      def resource
        current_account.activity_outdoor_walk.find(params[:id])
      end
    end
  end
end
