class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string

  # Direct associations

  has_many   :articles,
             foreign_key: :uploader_id

  has_many   :comments,
             foreign_key: :commenter_id

  has_many   :favorites,
             foreign_key: :favoriter_id

  # Indirect associations

end
