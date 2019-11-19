# frozen_string_literal: true

module My
  module Activity
    class OutdoorWalksController < BaseController
      ACTION_MAP = {
        create: :create,
        update: :update
      }.freeze

      include Import['find_by_created_today', service: 'activity.outdoor_walks.service']

      def index
        @outdoor_walks = current_account.activity_outdoor_walk.order(created_at: :desc)
      end

      def new
        # rubocop:disable Rails/DynamicFindBy
        created_today = find_by_created_today.call(resource)
        # rubocop:enable Rails/DynamicFindBy
        if created_today
          redirect_to edit_my_activity_outdoor_walk_path(created_today)
        else
          @outdoor_walk = current_account.activity_outdoor_walk.new
        end
      end

      def create
        if result.success?
          redirect_to my_activity_outdoor_walks_path, notice: 'Record was successfully created'
        else
          @errors = result.failure
          @outdoor_walk = current_account.activity_outdoor_walk.new(outdoor_walk_params)
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
          @outdoor_walk = current_account.activity_outdoor_walk.new(outdoor_walk_params)
          render :edit
        end
      end

      private

      def result
        @result ||= service.send(action, resource: resource, attributes: outdoor_walk_params)
      end

      def action
        ACTION_MAP[params[:action].to_sym]
      end

      def outdoor_walk_params
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
