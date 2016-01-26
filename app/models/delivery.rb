class Delivery < ActiveRecord::Base
  belongs_to :client
  has_many :pieces

  validates :date, presence: true
  validates :piececount, presence: true
  
end
