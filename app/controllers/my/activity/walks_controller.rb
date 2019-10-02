# frozen_string_literal: true

module My
  module Activity
    class WalksController < BaseController
      def index
        @walks = current_account.activity_walk.order(created_at: :desc)
      end

      def new
        @walk = current_account.activity_walk.new
      end

      def create
        @walk = current_account.activity_walk.new(walk_params)

        if @walk.save
          redirect_to my_activity_walks_path, notice: 'Record was successfully created'
        else
          render :new
        end
      end

      def edit
        @walk = resource
      end

      def update
        @walk = resource
        if @walk.update(walk_params)
          redirect_to my_activity_walks_path, notice: 'Record was successfully updated'
        else
          render :edit
        end
      end

      private

      def walk_params
        params.require(:activity_walk).permit(:distance_unit, :distance, :steps, :feeling, :notes)
      end

      def resource
        current_account.activity_walk.find(params[:id])
      end
    end
  end
end
