class DropAccessoriesTable < ActiveRecord::Migration
  def change
  	drop_table :accessories
  end
end
