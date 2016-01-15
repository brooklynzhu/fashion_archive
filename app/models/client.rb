class Client < ActiveRecord::Base
  belongs_to :collection_manager
  has_many :pieces
  
end
