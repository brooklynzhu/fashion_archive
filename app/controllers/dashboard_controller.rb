class DashboardController < ApplicationController
	
	def index
		@pending_pickups = []
		Pickup.all.each do |pickup|
			if pickup.completed != true
				@pending_pickups << pickup
			end
		end

		@pending_deliveries = []
		Delivery.all.each do |delivery|
			if delivery.completed != true
				@pending_deliveries << delivery
			end
		end	
			
	end

	def completed
		@pickups = Pickup.where(completed: true)
		@deliveries = Delivery.where(completed: true)
	end

end