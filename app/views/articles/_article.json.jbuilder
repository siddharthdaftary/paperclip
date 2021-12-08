json.extract! article, :id, :link, :uploader_review, :uploader_id,
              :publication, :estimated_reading_time, :tag_id, :created_at, :updated_at
json.url article_url(article, format: :json)
