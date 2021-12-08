class Comment < ApplicationRecord
  # Direct associations

  belongs_to :article

  belongs_to :commenter,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    comment
  end
end
