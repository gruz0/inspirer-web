# frozen_string_literal: true

module My
  module Learning
    class VideosController < BaseController
      include Import[service: 'learning.videos.service']

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
        super { my_learning_videos_path }
      end

      def edit
        super
      end

      def update
        super { my_learning_videos_path }
      end

      private

      def resource_params
        params.require(:learning_video)
              .permit(:url, :title, :feeling, :notes, :created_at)
              .to_h.symbolize_keys
      end

      def resource_class
        current_account.learning_video
      end
    end
  end
end
