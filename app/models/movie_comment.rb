class MovieComment < ApplicationRecord
  belongs_to :customer
  belongs_to :movie
end
