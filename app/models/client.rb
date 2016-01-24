class Client < ActiveRecord::Base
  belongs_to :collection_manager
  has_many :pieces
  has_many :deliveries
  has_many :pickups


 

  
end
