class PickupsController < ApplicationController

	def index
		@pickups = Pickup.all

	end

	def show
		@pickup = Pickup.find(params[:id])
		@client = @pickup.client.name

	end


	def new
		
		@pickup = Pickup.new

	end

	def create
		@pickup = Pickup.create(safe_pickup_params)
		if @pickup.save
			flash[:notice] = "Pickup created!"
			redirect_to pickup_path(@pickup)
		else
			flash[:notice] = "Error!"
			render :new
		end
	end



	private

	def safe_pickup_params

		params.require(:pickup).permit(:date, :notes, :client_id)

	end

end