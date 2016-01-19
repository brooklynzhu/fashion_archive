class Pickup < ActiveRecord::Base
  belongs_to :client
  has_many :pieces

end
