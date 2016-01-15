class AddAttachmentPhotoToPieces < ActiveRecord::Migration
   def self.up
    add_attachment :pieces, :photo
  end

  def self.down
    remove_attachment :pieces, :photo
  end
end