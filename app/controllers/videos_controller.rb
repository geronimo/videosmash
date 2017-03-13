class VideosController < ApplicationController
  before_filter :authenticate_user!

  def view
    video = Video.find(params[:id])
    @previous_view = current_user.video_views.create(video: video, genre: video.genre, title: video.title)

    respond_to do |format|
      format.js
    end
  end
end
