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

  belongs_to :tag

  has_many   :comments

  has_many   :favorites

  belongs_to :uploader,
             resource: UserResource

  # Indirect associations

  has_many :fan_readers, resource: UserResource do
    assign_each do |article, users|
      users.select do |u|
        u.id.in?(article.fan_readers.map(&:id))
      end
    end
  end

  has_many :readers, resource: UserResource do
    assign_each do |article, users|
      users.select do |u|
        u.id.in?(article.readers.map(&:id))
      end
    end
  end


  filter :sender_id, :integer do
    eq do |scope, value|
      scope.eager_load(:readers).where(:follow_requests => {:sender_id => value})
    end
  end

  filter :recipient_id, :integer do
    eq do |scope, value|
      scope.eager_load(:fan_readers).where(:follow_requests => {:recipient_id => value})
    end
  end
end
