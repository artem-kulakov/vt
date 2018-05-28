json.extract! review, :id, :operator_id, :categoria, :cantidad, :created_at, :updated_at
json.url review_url(review, format: :json)
