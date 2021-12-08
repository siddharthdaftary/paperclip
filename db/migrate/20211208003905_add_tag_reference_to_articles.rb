class AddTagReferenceToArticles < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :articles, :tags
    add_index :articles, :tag_id
  end
end
