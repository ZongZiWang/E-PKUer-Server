class ChangeBusyForRestaurants < ActiveRecord::Migration
  def up
	  remove_column :restaurants, :busy
	  add_column :restaurants, :status_busy, :integer, :default => 0
	  add_column :restaurants, :status_normal, :integer, :default => 0
	  add_column :restaurants, :status_loose, :integer, :default => 0
  end

  def down
	  add_column :restaurants, :busy, :string
	  remove_column :restaurants, :status_busy
	  remove_column :restaurants, :status_normal
	  remove_column :restaurants, :status_loose
  end
end
