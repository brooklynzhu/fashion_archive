class PickupsController < ApplicationController

	def index
		@client = Client.find(params[:client_id])
		@pickups = @client.pickups
		@pending_pickups = @pickups.where(completed: false)
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

	def edit
		@pickup = Pickup.find(params[:id])
		@client = @pickup.client
	end

	def update
		@pickup = Pickup.find(params[:id])
		if @pickup.update(safe_pickup_params)
			flash[:notice] = "Pickup Updated!"
			redirect_to pickup_path(@pickup)
		else
			render edit_pickup_path
		end
	end

	def check_in	
		@client = Client.find(params[:client_id])
		@pieces = @client.pieces.where(location: 'At Client')
		
	end

	def complete_check_in
		@pickup = Pickup.find(params[:pickup_id])
		@client = @pickup.client_id
		Piece.where(id: params[:piece_ids]).update_all(location: "On Site", pickup_id: @pickup)
		redirect_to pickup_path(@pickup)

	end

	def completed
		@pickup = Pickup.find(params[:pickup_id])

		if @pickup.completed != true
			if @pickup.pieces.count != @pickup.piececount
				flash[:alert] = "Pieces in pickup must equal the number of associated pieces!"
				redirect_to pickup_path(@pickup)
			else
				@pickup.update(completed: true)
				flash[:notice] = "Pickup has been marked as complete!"
				redirect_to pickup_path(@pickup)
			end
		else
			@pickup.update(completed: false)
			redirect_to pickup_path(@pickup)
		end
	end

	def remove
		@pickup = Pickup.find(params[:pickup_id])
		@client = @pickup.client_id
		Piece.where(id: params[:piece_ids]).update_all(location: "On Site", pickup_id: 'nil')
		redirect_to pickup_path(@pickup)
	end



	private

	def safe_pickup_params

		params.require(:pickup).permit(:date, :notes, :client_id, :piececount)

	end

end