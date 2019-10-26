# frozen_string_literal: true

module My
  module Learning
    class VideosController < BaseController
      def index
        @videos = current_account.learning_video.order(created_at: :desc)
      end

      def new
        @video = current_account.learning_video.new
      end

      def create
        @video = current_account.learning_video.new(video_params)

        if @video.save
          FetchLinkTitleWorker.perform_async(@video.class, @video.id, @video.url) if @video.title.blank?

          redirect_to my_learning_videos_path, notice: 'Record was successfully created'
        else
          render :new
        end
      end

      private

      def video_params
        params.require(:learning_video).permit(:url, :title, :feeling, :notes)
      end
    end
  end
end
