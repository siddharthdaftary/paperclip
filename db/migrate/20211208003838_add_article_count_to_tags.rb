class AddArticleCountToTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :articles_count, :integer
  end
end
