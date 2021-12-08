class Tag < ApplicationRecord
  # Direct associations

  has_many   :articles,
             dependent: :nullify

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    tag
  end
end
