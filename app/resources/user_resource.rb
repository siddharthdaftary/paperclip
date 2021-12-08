class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string

  # Direct associations

  has_many   :recieved_follow_requests,
             resource: FollowRequestResource,
             foreign_key: :recipient_id

  has_many   :sent_follow_requests,
             resource: FollowRequestResource,
             foreign_key: :sender_id

  has_many   :articles,
             foreign_key: :uploader_id

  has_many   :comments,
             foreign_key: :commenter_id

  has_many   :favorites,
             foreign_key: :favoriter_id

  # Indirect associations

  has_many :liked_articles, resource: ArticleResource do
    assign_each do |user, articles|
      articles.select do |a|
        a.id.in?(user.liked_articles.map(&:id))
      end
    end
  end

  has_many :reading_activity, resource: ArticleResource do
    assign_each do |user, articles|
      articles.select do |a|
        a.id.in?(user.reading_activity.map(&:id))
      end
    end
  end


  filter :article_id, :integer do
    eq do |scope, value|
      scope.eager_load(:reading_activity).where(:favorites => {:article_id => value})
    end
  end
end
