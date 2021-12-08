class TagResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :tag, :string

  # Direct associations

  has_many :articles

  # Indirect associations
end
