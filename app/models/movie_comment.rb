class MovieComment < ApplicationRecord
  belongs_to :customer
  belongs_to :movie
  attachment :image
  validates :rate, presence: true
end
