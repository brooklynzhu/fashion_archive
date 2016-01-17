class PickupsController < ApplicationController

	def index
		@pickups = Pickup.all

	end

	def show
		@pickup = Pickup.find(params[:id])
		@client_name = @pickup.client.name
		@client_id = @pickup.client_id


	end


	def new
		@client = Client.find(params[:client_id])
		@pickup = @client.pickups.new

	end

	def create
		@client = Client.find(params[:client_id])
		@pickup = @client.pickups.create(safe_pickup_params)
		if @pickup.save
			flash[:notice] = "Pickup created!"
			redirect_to pickup_path(@pickup)
		else
			flash[:notice] = "Error!"
			render :new
		end
	end

	def check_in
		


	end

	def complete_check_in

	end



	private

	def safe_pickup_params

		params.require(:pickup).permit(:date, :notes, :client_id, :piececount)

	end

end