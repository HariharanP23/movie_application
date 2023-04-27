class CommentsController < ApplicationController
  before_action :set_comment, only: %i[update destroy]
  before_action :set_movie



  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.movie_id = @movie.id
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to movie_path(@movie), notice: "Comment was successfully created." }
      else
        format.html { render :'movies/show' }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:comment, :movie_id, :user_id)
    end
end

