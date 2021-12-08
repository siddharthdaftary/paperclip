class Article < ApplicationRecord
  # Direct associations

  belongs_to :tag,
             :required => false,
             :counter_cache => true

  has_many   :comments,
             :dependent => :destroy

  has_many   :favorites,
             :dependent => :destroy

  belongs_to :uploader,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    link
  end

end
