class RemovePhotoFromPieces < ActiveRecord::Migration
  def change
  	remove_column :pieces, :photo, :string
  end
end
