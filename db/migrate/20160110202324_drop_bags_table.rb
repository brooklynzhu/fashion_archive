class DropBagsTable < ActiveRecord::Migration
  def change
  	drop_table :bags
  end
end
