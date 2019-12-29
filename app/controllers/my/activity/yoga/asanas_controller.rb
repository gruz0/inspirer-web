# frozen_string_literal: true

module My
  module Activity
    module Yoga
      class AsanasController < BaseController
        include Import[service: 'activity.yoga.asanas.service']

        def index
          @asanas = resource.order(created_at: :desc)
        end

        def new
          @asana = resource.new
        end

        def create
          if result.success?
            redirect_to my_activity_yoga_asanas_path, notice: 'Record was successfully created'
          else
            @errors = result.failure
            @asana = resource.new(resource_params)
            render :new
          end
        end

        def edit
          @asana = resource
        end

        def update
          if result.success?
            redirect_to my_activity_yoga_asanas_path, notice: 'Record was successfully updated'
          else
            @errors = result.failure
            @asana = resource.new(resource_params)
            render :edit
          end
        end

        private

        def resource_params
          params.require(:activity_yoga_asana).permit(:notes, :feeling).to_h.symbolize_keys
        end

        def resource
          if params[:id]
            current_account.activity_yoga_asana.find(params[:id])
          else
            current_account.activity_yoga_asana
          end
        end
      end
    end
  end
end
