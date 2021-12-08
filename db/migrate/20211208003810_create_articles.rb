class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :link
      t.string :uploader_review
      t.integer :uploader_id
      t.string :publication
      t.string :estimated_reading_time
      t.integer :tag_id

      t.timestamps
    end
  end
end
