class RatingsController < ApplicationController
  before_action :set_movie

  def create
    @rating = Rating.new(rating_params)
    @rating.movie_id = @movie.id
    respond_to do |format|
      if @rating.save
        format.html { redirect_to movie_path(@movie), notice: "Rating was successfully created." }
      else
        format.html { render :'movies/show' }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    # Only allow a list of trusted parameters through.
    def rating_params
      params.require(:rating).permit(:star, :movie_id)
    end
end
