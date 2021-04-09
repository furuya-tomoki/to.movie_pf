class Admin::MoviesController < ApplicationController
before_action :authenticate_admin!


 def index
  @movies = Movie.all
  @q = Movie.ransack(params[:q])
    @movies = @q.result(didtinct: true)
 end

 def new
  @movie = Movie.new
 end

 def create
  @movie = Movie.new(movie_params)
  @movie.save!
  redirect_to admin_movies_path
 end

 def show
  @movie = Movie.find(params[:id])
 end

 def edit
  @movie = Movie.find(params[:id])
 end

 def update
  @movie = Movie.find(params[:id])
  if @movie.update(movie_params)
   redirect_to admin_movie_path(@movie)
  else
   render "edit"
  end
 end


private
 def movie_params
  params.require(:movie).permit(:customer_id, :genre_id, :image, :title, :director, :actor, :explain)
 end
end
