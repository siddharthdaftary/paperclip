class AddFavoriterReferenceToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :favorites, :users, column: :favoriter_id
    add_index :favorites, :favoriter_id
    change_column_null :favorites, :favoriter_id, false
  end
end
