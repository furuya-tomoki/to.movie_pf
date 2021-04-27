class Public::MoviesController < ApplicationController


  def create
    @movie = Movie.new(movie_params)
    @movie.save
    @movie_comment.save
    redirect_to root_path
  end

  def index
    @movies = Movie.page(params[:page]).reverse_order
    @q = Movie.ransack(params[:q])
     # params[:q] = ユーザーが記入したキーワード
    @movies = @q.result(distinct: true)
     # distinct = 重複レコードを一つにまとめる
     # rusult = レコードリレーションを返す
  end

  def show
    @movie_comments = MovieComment.all
    @movie = Movie.find(params[:id])
    @movie_comment = MovieComment.new
    @customer = Customer.find_by(id: params[:id])
    @movies = Movie.all
    @q = Movie.ransack(params[:q])
     # params[:q] = ユーザーが記入したキーワード
    @movies = @q.result(didtinct: true)
     # distinct = 重複レコードを一つにまとめる
     # rusult = レコードリレーションを返す
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to movie_path(@movie)
  end

  private

  def movie_params
    params.require(:movie).permit(:customer_id, :genre_id, :image, :title, :director, :actor, :explain, :evaluation, :cast, :actres, :quote)
  end
end
