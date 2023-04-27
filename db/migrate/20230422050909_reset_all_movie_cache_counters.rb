class ResetAllMovieCacheCounters < ActiveRecord::Migration[6.1]
  def up
    Movie.all.each do |movie|
      Movie.reset_counters(movie.id, :comments)
    end
  end
end
