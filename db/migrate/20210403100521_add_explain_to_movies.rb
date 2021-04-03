class AddExplainToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :explain, :text
  end
end
