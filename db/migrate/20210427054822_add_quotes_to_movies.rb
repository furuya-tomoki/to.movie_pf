class AddQuotesToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :quote, :string
  end
end
