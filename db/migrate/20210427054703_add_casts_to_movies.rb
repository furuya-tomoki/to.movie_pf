class AddCastsToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :cast, :string
  end
end
