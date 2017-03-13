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

    @previously_viewed = current_user.viewed_by @current_genre
    @current_video = current_user.next_video_by @current_genre

    respond_to do |format|
      format.html
      format.js
    end
  end
end
