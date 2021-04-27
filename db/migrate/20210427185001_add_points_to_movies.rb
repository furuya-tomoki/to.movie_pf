class AddPointsToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :point, :string
  end
end
