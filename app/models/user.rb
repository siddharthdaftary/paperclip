class User < ApplicationRecord
  # Direct associations

  has_many   :recieved_follow_requests,
             :class_name => "FollowRequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_follow_requests,
             :class_name => "FollowRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :articles,
             :foreign_key => "uploader_id",
             :dependent => :destroy

  has_many   :comments,
             :foreign_key => "commenter_id",
             :dependent => :destroy

  has_many   :favorites,
             :foreign_key => "favoriter_id",
             :dependent => :destroy

  # Indirect associations

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
