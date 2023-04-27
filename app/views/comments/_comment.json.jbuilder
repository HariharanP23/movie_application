json.extract! comment, :id, :comment, :movie_id, :user_id, :created_at, :updated_at
json.url movie_comment_url(comment.movie_id,comment, format: :json)
