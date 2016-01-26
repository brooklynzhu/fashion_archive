class Client < ActiveRecord::Base
  belongs_to :collection_manager
  has_many :pieces
  has_many :deliveries
  has_many :pickups

def self.search(search)
  Client.where("name LIKE ?", "%#{search}%")
end

has_attached_file :photo, 
          styles: {
                thumb: '100x100>',
                square: '200x200#',
                medium: '300x300>'
              },
          :bucket => :fashionarchive

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
 
  

 
  
end
