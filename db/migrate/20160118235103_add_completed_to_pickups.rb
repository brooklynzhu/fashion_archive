class AddCompletedToPickups < ActiveRecord::Migration
  def change
    add_column :pickups, :completed, :boolean, :default => false
  end
end
