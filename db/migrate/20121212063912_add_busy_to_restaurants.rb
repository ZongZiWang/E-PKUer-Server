class AddBusyToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :busy, :string
  end
end
