class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @genres = Genre.all
    if params[:genre]
      @current_genre = params[:genre][:genre_name]
      cookies[:current_genre] = @current_genre
    else
      if cookies[:current_genre]
        @current_genre = cookies[:current_genre]
      else
        @current_genre = @genres.sample.name
        cookies[:current_genre] = @current_genre
      end
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
