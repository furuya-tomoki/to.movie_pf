class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :movies
  has_many :favorites, dependent: :destroy
  has_many :movie_comments, dependent: :destroy

    # 自分がフォローされる（被フォロー）側の関係性
    # class_nameでRelationshipを参照している
    # foreign_key指定でrelationshipテーブルのどのカラムを参照するか指定
    # 会員idのフォローされる側の関係が取得できる
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
    # 自分がフォローする（与フォロー）側の関係性
    # 会員idをフォローする側の関係が取得できる
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    # 被フォロー関係を通じて参照⇨自分をフォローしている人
    # throughは上記のRelationshipを参照しているので、記述の順番が違ったらエラー
  has_many :followers, through: :reverse_of_relationships, source: :follower
    # 与フォロー関係を通じて参照→自分がフォローしている人
    # through = relationshipsテーブルを経由して、usersテーブルを参照し、多対多を可能にする
  has_many :followings, through: :relationships, source: :followed


  attachment :image
  validates :name, presence: true


  def follow(customer_id)
    relationships.create(followed_id: customer_id)
     # createメソッド
  end

  def unfollow(customer_id)
    relationships.find_by(followed_id: customer_id).destroy
     # relationshipsテーブルには対応するレコードはただ一つ
     # find_byによって1レコードを特定し、destroyメソッドで削除

  end

  def following?(customer)
    followings.include?(customer)
     # include?は対象の配列に引数のものが含まれていればtrue
     #含まれていなければfalseを返す
     # followingsの中に、customerが含めれていればtrue
  end
end
