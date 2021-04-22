class Public::HomesController < ApplicationController
  def top
    @movies = Movie.all
    @q = Movie.ransack(params[:q])
     # params[:q] = ユーザーが記入したキーワード
    @movies = @q.result(didtinct: true)
     # distinct = 重複レコードを一つにまとめる
     # rusult = レコードリレーションを返す
  end

  def about
  end

  def movie_params
    params.require(:movie).permit(:customer_id, :genre_id, :image, :title, :director, :actor, :explain)
  end
end
