class Admin::MoviesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @movies = Movie.all
    @q = Movie.ransack(params[:q])
     # params[:q] = ユーザーが記入したキーワード
    @movies = @q.result(distinct: true)
    # distinct = 重複レコードを一つにまとめる
    # rusult = レコードリレーションを返す
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save!
    redirect_to movies_path
  end

  def show
    @movie_comments = MovieComment.all
    @movie = Movie.find(params[:id])
    @movie_comment = MovieComment.new
    @customer = Customer.find_by(id: params[:id])
    # find_by = 指定したレコードを一つ探す
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
     @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
    redirect_to movies_path
    else
      render "edit"
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:customer_id, :genre_id, :image, :title, :director, :actor, :explain, :cast, :actres, :quote)
  end
end
