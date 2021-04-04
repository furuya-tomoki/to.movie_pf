class Movie < ApplicationRecord
  has_many :movie_comments
  has_many :favorites
  belongs_to :genre
  attachment :image
end
