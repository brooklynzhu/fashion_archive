class AddAttachmentPhotoToClients < ActiveRecord::Migration
   def self.up
    add_attachment :clients, :photo
  end

  def self.down
    remove_attachment :clients, :photo
  end
end
