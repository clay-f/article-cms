class AddUniqueIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :like_articles, [:user_id, :article_id], unique: true
  end
end
