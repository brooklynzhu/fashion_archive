class AddPickupToPieces < ActiveRecord::Migration
  def change
    add_reference :pieces, :pickup, index: true, foreign_key: true
  end
end
