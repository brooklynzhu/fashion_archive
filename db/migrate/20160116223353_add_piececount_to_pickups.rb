class AddPiececountToPickups < ActiveRecord::Migration
  def change
    add_column :pickups, :piececount, :integer
  end
end
