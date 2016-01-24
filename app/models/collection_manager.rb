class CollectionManager < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :clients


	def self.search(search)
  		CollectionManager.clients.where("name LIKE ?", "%#{search}%")
  	end
end
