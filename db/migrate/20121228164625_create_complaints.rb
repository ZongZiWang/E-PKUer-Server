class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.string :content

      t.timestamps
    end
  end
end
