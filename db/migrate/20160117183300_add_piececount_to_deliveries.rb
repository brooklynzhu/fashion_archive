class AddPiececountToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :piececount, :integer
  end
end
