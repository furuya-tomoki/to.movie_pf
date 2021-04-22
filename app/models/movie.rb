class Movie < ApplicationRecord
  has_many :movie_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :customer
  belongs_to :genre
  attachment :image

  def avg_rate
    unless self.movie_comments.empty?
      movie_comments.average(:rate).round(1)
    else
       0.0
    end
  end

  def avg_rate_percentage
    unless self.movie_comments.empty?
      movie_comments.average(:rate).round(1).to_f * 100 / 5
    else
      0.0
    end
  end

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end


  # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる
  # 存在していればtrue、存在していなければfalseを返す
end
