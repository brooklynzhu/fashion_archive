class AddDefaultValueToCompleted < ActiveRecord::Migration
  def up
  	change_column :pickups, :completed, :boolean, :default => false
  end

  def down
  	change_column :pickups, :completed, :boolean, :default => nil
  end

end
