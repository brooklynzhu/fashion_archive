class DashboardController < ApplicationController
	
	def index
		
		@pickups = Pickup.all
		@deliveries = Delivery.all
			
	end

	def completed
		@pickups = Pickup.where(completed: true)
		@deliveries = Delivery.where(completed: true)
	end

end