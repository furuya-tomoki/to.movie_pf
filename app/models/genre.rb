class Genre < ApplicationRecord
  has_many :movies
  validates :name, presence: true, uniqueness: true
  # uniqueness = 属性の値が重複していないことを検証します。
end
