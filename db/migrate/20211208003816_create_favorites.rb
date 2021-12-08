class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :favoriter_id
      t.integer :article_id

      t.timestamps
    end
  end
end
