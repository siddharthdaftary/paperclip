class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :article,
             counter_cache: true

  belongs_to :favoriter,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    favoriter.to_s
  end
end
