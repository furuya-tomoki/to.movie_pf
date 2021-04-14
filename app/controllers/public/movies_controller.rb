class Public::MoviesController < ApplicationController


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
