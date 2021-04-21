class Public::MoviesController < ApplicationController
  require 'themoviedb-api'
  Tmdb::Api.key("c2b443387cf5821b863c160c4c061371")
  Tmdb::Api.language("ja")

  def search
    @input = Movie.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
  end
  end


  def create
    @movie = Movie.new(movie_params)
    @movie.save
    @movie_comment.save
    redirect_to root_path
  end

  def index
    @movies = Movie.all
    @q = Movie.ransack(params[:q])
    @movies = @q.result(didtinct: true)
  end

  def show
    @movie_comments = MovieComment.all
    @movie = Movie.find(params[:id])
    @movie_comment = MovieComment.new
    @customer = Customer.find_by(id: params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
   redirect_to movie_path(@movie)

  end

  private
  def movie_params
    params.require(:movie).permit(:customer_id, :genre_id, :image, :title, :director, :actor, :explain, :evaluation)
  end

end
