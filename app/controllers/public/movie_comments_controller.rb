class Public::MovieCommentsController < ApplicationController
  def new
  end

  def index
    @movie = Movie.find(params[:movie_id])
    @movie_comments = @movie.movie_comments
  end

  def show
    @movie_comment = MovieComment.find(params[:id])
  end

  def create
    @movie_comment = MovieComment.new(movie_comment_params)
    @movie_comment.customer_id = current_customer.id
    if @movie_comment.save
      redirect_to movies_path
    else
      @movie = Movie.find(params[:movie_id])
      render "public/movies/show"
    end
  end

  def destroy
    MovieComment.find_by(id: params[:id], movie_id: params[:movie_id]).destroy
    redirect_to movie_path(params[:movie_id])
  end

  private

  def movie_comment_params
    params.require(:movie_comment).permit(:comment, :rate, :customer_id, :movie_id)
  end
end
