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
  unless @movie_comment.save
   @movie = Movie.find(params[:movie_id])
   render "public/movies/show"
  end
 end

 def destroy
    @movie = Movie.find(params[:book_id])
    favorite = @movie.favorites.find_by(customer_id: current_customer.id)
    favorite.destroy
 end

private
 def movie_comment_params
  params.require(:movie_comment).permit(:comment, :rate, :customer_id, :movie_id)
 end
end
