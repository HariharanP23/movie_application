class Comment < ApplicationRecord
  belongs_to :movie, counter_cache: true
  belongs_to :user

  validates :comment, presence: true
  validates :movie_id, presence: true, numericality: {only_integer: true}
  validates :user_id, presence: true, numericality: {only_integer: true}
end
