class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :title
      t.string :body
      t.integer :user_id
      t.string :image_id
      t.datetime :updated_at, null: false
      t.datetime :created_at, null: false

      t.timestamps
    end
  end
end
