json.extract! favorite, :id, :favoriter_id, :article_id, :created_at,
              :updated_at
json.url favorite_url(favorite, format: :json)
