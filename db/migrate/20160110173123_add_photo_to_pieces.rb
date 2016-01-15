class AddPhotoToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :photo, :string
  end
end
