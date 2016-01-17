class AddDeliveryToPieces < ActiveRecord::Migration
  def change
    add_reference :pieces, :delivery, index: true, foreign_key: true
  end
end
