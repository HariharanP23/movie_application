module MoviesHelper
  def assign_movie_creator(movie, creator)
    movie.user = creator
    movie
  end
end
