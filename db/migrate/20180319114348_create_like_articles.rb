class CreateLikeArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :like_articles do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.integer :state, null: false

      t.timestamps
    end
  end
end
