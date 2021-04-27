class Admin::MovieCommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @movie = Movie.find(params[:movie_id])
    @movie_comments = @movie.movie_comments
    @movies = Movie.all
    @q = Movie.ransack(params[:q])
     # params[:q] = ユーザーが記入したキーワード
    @movies = @q.result(didtinct: true)
     # distinct = 重複レコードを一つにまとめる
     # rusult = レコードリレーションを返す
  end

  def show
    @movie_comment = MovieComment.find(params[:id])
  end

  def create
    @movie_comment = MovieComment.new(movie_comment_params)
    @movie_comment.customer_id = current_customer.id
    @movie_comment.save
    redirect_to movie_movie_comments_path(@movie_comment.movie)
  end

  def destroy
    @movie_comment = MovieComment.find(params[:id])
    @movie_comment.customer_id = current_customer.id
    @movie_comment.destroy
    redirect_to admin_movies_path
  end

  private

  def movie_comment_params
    params.require(:movie_comment).permit(:comment, :rate, :customer_id, :movie_id)
  end
end
