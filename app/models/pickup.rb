class Pickup < ActiveRecord::Base
  belongs_to :client
  has_many :pieces, through: :clients

end
