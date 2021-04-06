class ChangeDatatypeImageIdOfMovies < ActiveRecord::Migration[5.2]
  def change
    change_column :movies, :image_id, :string
  end
end
