json.extract! movie, :id, :Sample_video, :Name, :release_date, :user_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
json.Sample_video url_for(movie.Sample_video)
