class ChangeColumnDefaultToMovieComments < ActiveRecord::Migration[5.2]
  def change
     change_column_default :movie_comments, :rate, from: nil, to: "0"
  end
end
