class HomeController < ApplicationController
  def index
    @genres = Genre.all

    if params[:genre]
      @current_genre = params[:genre][:genre_name]
    else
      @current_genre = @genres.sample.name
    end

    @all_videos = Video.where(genre: @current_genre)
  end
end
