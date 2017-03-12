class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @genres = Genre.all
    if params[:genre]
      @current_genre = params[:genre][:genre_name]
    else
      @current_genre = @genres.sample.name
    end
    @current_video = Video.where(genre: @current_genre).sample
    @previouly_viewed = current_user.videos

    respond_to do |format|
      format.html
      format.js
    end
  end
end
