class DropClothingsTable < ActiveRecord::Migration
  def change
  	drop_table :clothings
  end
end
