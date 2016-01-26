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

		@query = params[:search]
 		@search_results = Client.search_for(@query)
 		@client_results = @search_results.where(collection_manager_id: current_collection_manager)
 

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