# frozen_string_literal: true

module My
  module Activity
    class OutdoorWalksController < BaseController
      include Import['find_by_created_today', service: 'activity.outdoor_walks.service']

      def index
        @outdoor_walks = resource.order(created_at: :desc)
      end

      def new
        # rubocop:disable Rails/DynamicFindBy
        created_today = find_by_created_today.call(resource)
        # rubocop:enable Rails/DynamicFindBy
        if created_today
          redirect_to edit_my_activity_outdoor_walk_path(created_today)
        else
          @outdoor_walk = resource.new
        end
      end

      def create
        if result.success?
          redirect_to my_activity_outdoor_walks_path, notice: 'Record was successfully created'
        else
          @errors = result.failure
          @outdoor_walk = resource.new(resource_params)
          render :new
        end
      end

      def edit
        @outdoor_walk = resource
      end

      def update
        if result.success?
          redirect_to my_activity_outdoor_walks_path, notice: 'Record was successfully updated'
        else
          @errors = result.failure
          @outdoor_walk = resource.new(resource_params)
          render :edit
        end
      end

      private

      def result
        @result ||= service.send(action, resource: resource, attributes: resource_params)
      end

      def resource_params
        params.require(:activity_outdoor_walk)
              .permit(:distance_unit, :distance, :steps, :feeling, :notes)
              .to_h.symbolize_keys
      end

      def resource
        if params[:id]
          current_account.activity_outdoor_walk.find(params[:id])
        else
          current_account.activity_outdoor_walk
        end
      end
    end
  end
end
