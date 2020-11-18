class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname, null: false, unique: true
      t.integer :living_alone_month, null: false
      t.string :profile_image_id
      t.string :email, null: false, unique: true
      t.string :encrypted_password, null: false
      t.boolean :is_deleted, default: false, null: false
      t.timestamps
    end
  end
end
