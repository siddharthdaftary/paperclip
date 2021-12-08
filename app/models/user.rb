class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :recieved_follow_requests,
             class_name: "FollowRequest",
             foreign_key: "recipient_id",
             dependent: :destroy

  has_many   :sent_follow_requests,
             class_name: "FollowRequest",
             foreign_key: "sender_id",
             dependent: :destroy

  has_many   :articles,
             foreign_key: "uploader_id",
             dependent: :destroy

  has_many   :comments,
             foreign_key: "commenter_id",
             dependent: :destroy

  has_many   :favorites,
             foreign_key: "favoriter_id",
             dependent: :destroy

  # Indirect associations

  has_many   :followers,
             through: :recieved_follow_requests,
             source: :sender

  has_many   :following,
             through: :sent_follow_requests,
             source: :recipient

  has_many   :favorite_articles,
             through: :favorites,
             source: :article

  has_many   :liked_articles,
             through: :followers,
             source: :favorite_articles

  has_many   :reading_activity,
             through: :following,
             source: :favorite_articles

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
