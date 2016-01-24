class ChangePickupsDate < ActiveRecord::Migration
  def change
    change_column :pickups, :date, :date
  end
end
