# frozen_string_literal: true

module My
  module Activity
    module Yoga
      class AsanasController < BaseController
        def index
          @asanas = current_account.activity_yoga_asana.order(created_at: :desc)
        end

        def new
          @asana = current_account.activity_yoga_asana.new
        end

        def create
          @asana = current_account.activity_yoga_asana.new(asana_params)

          if @asana.save
            redirect_to my_activity_yoga_asanas_path, notice: 'Record was successfully created'
          else
            render :new
          end
        end

        private

        def asana_params
          params.require(:activity_yoga_asana).permit(:notes, :feeling)
        end
      end
    end
  end
end
