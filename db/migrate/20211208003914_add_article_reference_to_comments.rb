class AddArticleReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :articles
    add_index :comments, :article_id
    change_column_null :comments, :article_id, false
  end
end
