class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :comment, :string
  attribute :commenter_id, :integer
  attribute :article_id, :integer

  # Direct associations

  belongs_to :article

  belongs_to :commenter,
             resource: UserResource

  # Indirect associations
end
