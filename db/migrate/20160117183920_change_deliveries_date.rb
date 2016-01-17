class ChangeDeliveriesDate < ActiveRecord::Migration
  def change
    change_column :deliveries, :date, :datetime
  end
end
