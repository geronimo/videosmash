class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @genres = Genre.all
    if params[:genre]
      @current_genre = params[:genre][:genre_name]
    else
      @current_genre = @genres.sample.name
    end

    @previously_viewed = current_user.video_views.where(genre: @current_genre).order_by(created_at: -1)

    @current_video = Video.where(genre: @current_genre).sample
    while current_user.video_views.where(video: @current_video).exists?
      @current_video = Video.where(genre: @current_genre).sample
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
