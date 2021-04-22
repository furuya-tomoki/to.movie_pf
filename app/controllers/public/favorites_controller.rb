class Public::FavoritesController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    favorite = @movie.favorites.new(customer_id: current_customer.id)
     # いいねできるのでは、idを持つ会員のみ = ログイン中の会員
    favorite.save
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    favorite = @movie.favorites.find_by(customer_id: current_customer.id)
     # いいね削除できるのでは、idを持つ会員のみ = ログイン中の会員
    favorite.destroy
  end
end
