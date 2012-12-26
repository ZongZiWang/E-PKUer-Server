class CreateDishComments < ActiveRecord::Migration
  def change
    create_table :dish_comments do |t|
      t.integer :dish_id
      t.integer :user_id
      t.string :user_name
      t.float :evaluation
      t.string :time
      t.string :content

      t.timestamps
    end
  end
end
