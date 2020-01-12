# frozen_string_literal: true

module My
  module Learning
    class PodcastsController < BaseController
      include Import[service: 'learning.podcasts.service']

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
        super { my_learning_podcasts_path }
      end

      def edit
        super
      end

      def update
        super { my_learning_podcasts_path }
      end

      private

      def resource_params
        params.require(:learning_podcast).permit(:url, :title, :feeling, :notes).to_h.symbolize_keys
      end

      def resource_class
        current_account.learning_podcast
      end
    end
  end
end
