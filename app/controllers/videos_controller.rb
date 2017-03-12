class VideosController < ApplicationController
  before_filter :authenticate_user!

  def view
    video = Video.find(params[:id])
    current_user.video_views.create(video: video)

    @previously_viewed = current_user.video_views.order_by(created_at: -1)

    respond_to do |format|
      format.js
    end
  end
end
