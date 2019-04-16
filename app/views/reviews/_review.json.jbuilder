json.extract! review, :id, :review, :headline, :body, :movie_id, :created_at, :updated_at
json.url review_url(review, format: :json)
