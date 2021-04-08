class Public::MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @movie_comment = MovieComment.new
     @customer = Customer.find_by(id: params[:id])
  end



  private
  def movie_params
    params.require(:movie).permit(:customer_id, :genre_id, :image, :title, :director, :actor, :explain)
  end

end
