class Admin::HomesController < ApplicationController
before_action :authenticate_admin!


  def top
    @movies = Movie.all
    @movies = Movie.page(params[:page]).reverse_order
  end

  def about
  end

  def movie_params
    params.require(:movie).permit(:customer_id, :genre_id, :image, :title, :director, :actor, :explain)
  end
end