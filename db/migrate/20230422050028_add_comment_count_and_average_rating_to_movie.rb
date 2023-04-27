class AddCommentCountAndAverageRatingToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :comments_count, :integer
    add_column :movies, :average_ratings, :float
  end
end
