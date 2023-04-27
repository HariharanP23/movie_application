class MoviesController < ApplicationController
  load_and_authorize_resource
  before_action :set_movie, only: %i[show edit update destroy]

  # GET /movies or /movies.json
  def index
    if params[:search].present?
      @movies = @movies.where('Name LIKE ?', "%#{params[:search]}%").order(average_ratings: :desc).includes([:user, :Sample_video_attachment]).paginate(page: params[:page], per_page:12)
    elsif (params[:from_date]&&params[:to_date]).present?
      @movies = Movie.movie_date(params[:from_date],params[:to_date]).order(average_ratings: :desc).includes([:user, :Sample_video_attachment]).all.paginate(page: params[:page], per_page:12)
      @movie_count = @movies.count
    else
      @movies = Movie.order(average_ratings: :desc).includes([:user, :Sample_video_attachment,:Sample_video_blob]).all.paginate(page: params[:page], per_page:12)
    end
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice:"Movie was successfully created."}
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:Sample_video, :Name, :release_date, :user_id)
    end
end
