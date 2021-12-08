class FollowRequest < ApplicationRecord
  # Direct associations

  belongs_to :recipient,
             :class_name => "User",
             :counter_cache => :recieved_follow_requests_count

  belongs_to :sender,
             :class_name => "User",
             :counter_cache => :sent_follow_requests_count

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    sender.to_s
  end

end
