class AddUploaderReferenceToArticles < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :articles, :users, column: :uploader_id
    add_index :articles, :uploader_id
    change_column_null :articles, :uploader_id, false
  end
end
