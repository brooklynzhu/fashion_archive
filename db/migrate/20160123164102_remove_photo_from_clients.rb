class RemovePhotoFromClients < ActiveRecord::Migration
  def change
  	remove_column :clients, :photo, :string
  end
end
