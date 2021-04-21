class Public::SearchesController < ApplicationController
  def index
    @movies = Movie.search(params[:keyword])
    respond_to do |format|
      format.html
        format.json
    end
  end
end
