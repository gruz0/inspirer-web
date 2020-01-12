# frozen_string_literal: true

module My
  module Activity
    module Yoga
      class AsanasController < BaseController
        include Import[service: 'activity.yoga.asanas.service']

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
          super { my_activity_yoga_asanas_path }
        end

        def edit
          super
        end

        def update
          super { my_activity_yoga_asanas_path }
        end

        private

        def resource_params
          params.require(:activity_yoga_asana).permit(:notes, :feeling).to_h.symbolize_keys
        end

        def resource_class
          current_account.activity_yoga_asana
        end
      end
    end
  end
end
