class Public::MovieCommentsController < ApplicationController
  def new
  end

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
     # movie_comment.customer_id = ログイン中の会員
     # ログイン中の会員しかコメント保存できない
    if @movie_comment.save
      redirect_to movie_movie_comments_path(@movie_comment.movie)
    else
      @movie = Movie.find(params[:movie_id])
       # showにいくためには、上記の定義が必要
      render "public/movies/show"
    end
  end

  def destroy
    @movie_comment = MovieComment.find(params[:id])
    @movie_comment.customer_id = current_customer.id
     # movie_comment.customer_id = ログイン中の会員
     # ログイン中の会員しかコメント削除できない
    @movie_comment.destroy
    redirect_to movie_movie_comments_path(@movie_comment.movie)
  end

  private

  def movie_comment_params
    params.require(:movie_comment).permit(:comment, :rate, :customer_id, :movie_id)
  end
end
