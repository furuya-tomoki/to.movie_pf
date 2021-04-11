class AddRateToMovieComments < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_comments, :rate, :float
  end
end
