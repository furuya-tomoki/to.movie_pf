class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Customer"
  # follower_idカラムの値から、customerテーブルのレコードを参照できる
  belongs_to :followed, class_name: "Customer"
  # followed_idカラムの値から、customerテーブルのレコードを参照できる
end
