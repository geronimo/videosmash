class VideosController < ApplicationController
  before_filter :authenticate_user!

  def view
    video = Video.find(params[:id])
    current_user.videos << video

    @previously_viewed = current_user.videos

    respond_to do |format|
      format.js
    end
  end
end
