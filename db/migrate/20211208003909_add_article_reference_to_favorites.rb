class AddArticleReferenceToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :favorites, :articles
    add_index :favorites, :article_id
    change_column_null :favorites, :article_id, false
  end
end
