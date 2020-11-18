class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :user_id, null: false
      t.string :genre_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.string :image_id, null: false
      t.timestamps
    end
  end
end
