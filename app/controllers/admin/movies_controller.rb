class Admin::MoviesController < ApplicationController

 def index
 end

 def new
  @movie = Movie.new
 end

 def create
  @movie = Movie.find(params[:id])
  @movie.save!
  redirect_to root_path
 end

 def show
  @movie = Movie.find(params[:id])
 end

 def edit
   @movie = Movie.find(params[:id])
 end

 def update
 end


private
 def movie_params
  params.require(:movie).permit(:customer_id, :genre_id, :image, :title, :director, :actor, :explain)
 end
end
