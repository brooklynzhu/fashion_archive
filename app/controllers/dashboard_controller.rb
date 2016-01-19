class DashboardController < ApplicationController
	
	def index
		
		@pickups = Pickup.all
		@deliveries = Delivery.all
		
		
				
	end

end