class Movie < ApplicationRecord
  has_many :movie_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :genre
  attachment :image

  def avg_rate
    if movie_comments.empty?
      0.0
    else
      movie_comments.average(:rate).round(1).to_f
    end
  end
  def movie_comment_rate_percentage
    if movie_comments.empty?
      0.0
    else

      movie_comments.average(:rate).round(1).to_f*100/5
    end
  end

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
  # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べ
  # 存在していればtrue、存在していなければfalseを返す
end
