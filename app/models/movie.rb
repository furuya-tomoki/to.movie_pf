class Movie < ApplicationRecord
  has_many :movie_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :customer, optional: true
  belongs_to :genre
  attachment :image


   # unless = 条件式の結果が 偽(false) の場合に処理を実行
   # self = 付けるとクラスメソッド
   # self = 付けないとインスタンスメソッド
   # empty? = その配列の中身が空か、文字列の中身が空の場合にtrueを返す
   # roundメソッド = 四捨五入して、(1)桁数を指定
  def avg_rate
    unless self.movie_comments.empty?
      movie_comments.average(:rate).round(1)
    else
       0.0
    end
  end

  def avg_rate_percentage
    unless self.movie_comments.empty?
      # average = 平均値
      # to_f = 小数点
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
