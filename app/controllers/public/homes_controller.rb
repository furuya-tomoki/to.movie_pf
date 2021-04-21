class Public::HomesController < ApplicationController

  def top
    @movies = Movie.all
    @q = Movie.ransack(params[:q])
    @movies = @q.result(didtinct: true)

  end

  def about
  end

  def movie_params
    params.require(:movie).permit(:customer_id, :genre_id, :image, :title, :director, :actor, :explain)
  end

end
