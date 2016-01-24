class Client < ActiveRecord::Base
  belongs_to :collection_manager
  has_many :pieces
  has_many :deliveries
  has_many :pickups

def self.search(search)
  Client.where("name LIKE ?", "%#{search}%")
end
 

  
end
