class Article < ApplicationRecord
  # Direct associations

  belongs_to :uploader,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    link
  end

end
