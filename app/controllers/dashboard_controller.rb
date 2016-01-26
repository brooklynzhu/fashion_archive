class DashboardController < ApplicationController
	
	def index
		@collection_manager = current_collection_manager
		@clients = @collection_manager.clients
		@pending_pickups = []
		@clients.each do |c|
			c.pickups.each do |show|
				if show.completed != true
					@pending_pickups << show
				end
			end
		end	
	
		@pending_deliveries = []
		@clients.each do |d|
			d.deliveries.each do |show|
				if show.completed != true
					@pending_deliveries << show
				end
			end
		end

	end

	def completed
		@collection_manager = current_collection_manager
		@clients = @collection_manager.clients
		@completed_pickups = []
		@clients.each do |c|
			c.pickups.each do |show|
				if show.completed == true
					@completed_pickups << show
				end
			end
		end

		@completed_deliveries = []
		@clients.each do |d|
			d.deliveries.each do |show|
				if show.completed == true
					@completed_pickups << show
				end
			end
		end
	end

end