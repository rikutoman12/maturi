class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :menu_id
      t.datetime :updated_at, null: false
      t.datetime :created_at, null: false
      t.timestamps
    end
  end
end
