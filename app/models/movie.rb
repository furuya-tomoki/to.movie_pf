class Movie < ApplicationRecord
  has_many :movie_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :genre
  attachment :image

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?

  # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べ
  # 存在していればtrue、存在していなければfalseを返す
  end
end
