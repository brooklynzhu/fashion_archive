class DropShoesTable < ActiveRecord::Migration
  def change
  	drop_table :shoes
  end
end
