class Public::MovieCommentsController < ApplicationController

 def show
 end

 def update
 end

 def index
 end

 def edit
 end

 def create

  # @movie = Movie.find(params[:movie_id])
  @movie_comment = current_customer.movie_comments.new(movie_comment_params)
  @movie_comment.customer_id = current_customer.id
  @movie_comment.movie_id = params[:movie_id]
  @movie_comment.save
  redirect_to movies_path
 end

 def destroy
  @MovieComment.find_by(id:params[:id],movie_id:params[:movie_id]).destroy
  redirect_to movie_path(params[:movie_id])
 end

private
 def movie_comment_params
  params.require(:movie_comment).permit(:comment)
 end
end
