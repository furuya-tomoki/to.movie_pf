class Admin::MovieCommentsController < ApplicationController

  def create
  end

  def destroy
  @movie_comment = MovieComment.find(params[:id])
  @movie_comment.destroy
  redirect_to admin_movie_path
  end

end
