class Rating < ApplicationRecord
  belongs_to :movie

  validates :star, presence: true
  validates :movie_id, presence: true, numericality: {only_integer: true}


  after_save :update_rating

  def update_rating
    movie.update(average_ratings: movie.ratings.average(:star))
  end
end
