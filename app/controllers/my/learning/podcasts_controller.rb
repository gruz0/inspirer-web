# frozen_string_literal: true

module My
  module Learning
    class PodcastsController < BaseController
      def index
        @podcasts = current_account.learning_podcast.order(created_at: :desc)
      end

      def new
        @podcast = current_account.learning_podcast.new
      end

      def create
        @podcast = current_account.learning_podcast.new(podcast_params)

        if @podcast.save
          redirect_to my_learning_podcasts_path, notice: 'Record was successfully created'
        else
          render :new
        end
      end

      def edit
        @podcast = resource
      end

      def update
        @podcast = resource
        if @podcast.update(podcast_params)
          redirect_to my_learning_podcasts_path, notice: 'Record was successfully updated'
        else
          render :edit
        end
      end

      private

      def podcast_params
        params.require(:learning_podcast).permit(:url, :title, :feeling, :notes)
      end

      def resource
        current_account.learning_podcast.find(params[:id])
      end
    end
  end
end
