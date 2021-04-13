class Public::FavoritesController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    favorite = @movie.favorites.new(customer_id: current_customer.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    favorite = @movie.favorites.find_by(customer_id: current_customer.id)
    favorite.destroy
    redirect_to request.referer
  end
end
