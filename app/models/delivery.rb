class Delivery < ActiveRecord::Base
  belongs_to :client
  has_many :pieces, through :client
end
