class Movie < ApplicationRecord
  validates :Name, presence: true
  validates :user_id,presence: true, numericality: {only_integer: true}
  validates :release_date,presence: true


  belongs_to :user
  has_one_attached :Sample_video
  has_many :ratings,dependent: :destroy
  has_many :comments,dependent: :destroy


  def self.movie_date(from_date,to_date)
    if from_date.present? && to_date.present?
      where("release_date between ? and ?",from_date,to_date)
    elsif from_date.nil? && to_date.nil?
      where("release_date between ? and ?",Date.today.beginning_of_day,Date.tomorrow.end_of_day)
    end
  end

end
