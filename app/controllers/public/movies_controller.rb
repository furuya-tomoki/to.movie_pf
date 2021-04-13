class Public::MoviesController < ApplicationController
  def create
    @movie = Movie.new(movie_params)
    @movie.save
    @movie_comment.save
    redirect_to root_path
  end

  def index
    @movies = Movie.all
    # @movies = Movie.page(params[:page]).reverse_order
    @q = Movie.ransack(params[:q])
    @movies = @q.result(didtinct: true)
  end

  def show
    @movie_comments = MovieComment.all
    @movie = Movie.find(params[:id])
    @movie_comment = MovieComment.new
    @customer = Customer.find_by(id: params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to movie_path(movie)
  end

  def search
    @movies = Movies.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
      # 投稿情報を取得したら、jbuilderを使ってJavaScript側に返す。
      # 検索結果は、複数の投稿情報を表示させます。
      # そのため、複数の投稿情報が格納された配列を返すようなjbuilderの記述にする必要があります
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:customer_id, :genre_id, :image, :title, :director, :actor, :explain, :evaluation)
  end
end
