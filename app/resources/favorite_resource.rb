class FavoriteResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :favoriter_id, :integer
  attribute :article_id, :integer

  # Direct associations

  belongs_to :favoriter,
             resource: UserResource

  # Indirect associations

end
