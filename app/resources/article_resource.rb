class ArticleResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :link, :string
  attribute :uploader_review, :string
  attribute :uploader_id, :integer
  attribute :publication, :string
  attribute :estimated_reading_time, :string
  attribute :tag_id, :integer

  # Direct associations

  belongs_to :uploader,
             resource: UserResource

  # Indirect associations

end
