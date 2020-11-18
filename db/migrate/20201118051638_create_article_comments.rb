class CreateArticleComments < ActiveRecord::Migration[5.2]
  def change
    create_table :article_comments do |t|
      t.integer :user_id, null: false
      t.integer :article_id, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end
