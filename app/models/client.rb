class Client < ActiveRecord::Base
  belongs_to :collection_manager
  has_many :pieces
  has_many :deliveries
  has_many :pickups


  def self.search_for(search)
      where("name LIKE ?", "%#{search}%")
  end


end
