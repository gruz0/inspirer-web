# frozen_string_literal: true

module My
  module Learning
    class VideosController < BaseController
      ACTION_MAP = {
        create: :create,
        update: :update
      }.freeze

      include Import[service: 'learning.videos.service']

      def index
        @videos = current_account.learning_video.order(created_at: :desc)
      end

      def new
        @video = current_account.learning_video.new
      end

      def create
        if result.success?
          fetch_link_title(result.success[:resource])

          redirect_to my_learning_videos_path, notice: 'Record was successfully created'
        else
          @errors = result.failure
          @video = current_account.learning_video.new(video_params)
          render :new
        end
      end

      def edit
        @video = resource
      end

      def update
        if result.success?
          fetch_link_title(result.success[:resource])

          redirect_to my_learning_videos_path, notice: 'Record was successfully updated'
        else
          @errors = result.failure
          @video = current_account.learning_video.new(video_params)
          render :edit
        end
      end

      private

      def result
        @result ||= service.send(action, resource: resource, attributes: video_params)
      end

      def action
        ACTION_MAP[params[:action].to_sym]
      end

      def video_params
        params.require(:learning_video).permit(:url, :title, :feeling, :notes).to_h.symbolize_keys
      end

      def resource
        if params[:id]
          current_account.learning_video.find(params[:id])
        else
          current_account.learning_video
        end
      end
    end
  end
end
