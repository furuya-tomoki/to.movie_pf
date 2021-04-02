class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :customer_id
      t.integer :genre_id
      t.integer :image_id
      t.string :title
      t.string :director
      t.string :actor

      t.timestamps
    end
  end
end
