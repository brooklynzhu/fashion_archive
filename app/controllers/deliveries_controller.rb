class DeliveriesController < ApplicationController


	def index
		@client = Client.find(params[:client_id])
		@deliveries = Delivery.all

	end

	def show
		@delivery = Delivery.find(params[:id])
		@client_name = @delivery.client.name
		@client_id = @delivery.client_id
		@pieces = @delivery.pieces

	end

	def new
		@client = Client.find(params[:client_id])
		@delivery = @client.deliveries.new

	end

	def create
		@client = Client.find(params[:client_id])
		@delivery = @client.deliveries.create(safe_delivery_params)
		if @delivery.save
			flash[:notice] = "Delivery created!"
			redirect_to delivery_path(@delivery)
		else
			flash[:alert] = "Error!"
			render :new
		end
	end

	def edit
		@delivery = Delivery.find(params[:id])
		@client = @delivery.client

	end

	def update
		@delivery = Delivery.find(params[:id])
		if @delivery.update(safe_delivery_params)
			flash[:notice] = "Delivery updated!"
			redirect_to delivery_path(@delivery)
		else
			render edit_delivery_path
		end
	end


	def check_out
		@client_id = params[:client_id]
		@client = Client.find(@client_id)
		@pieces = @client.pieces.where(location: 'On Site')
	end

	def complete_check_out
		@delivery = Delivery.find(params[:delivery_id])
		@client = @delivery.client_id
		Piece.where(id: params[:piece_ids]).update_all(location: "At Client", delivery_id: @delivery)
		redirect_to delivery_path(@delivery)

	end

	def destroy
		@delivery = Delivery.find(params[:id]).destroy
		@client = @delivery.client
		redirect_to client_path(@client)
	end

	def completed
		@delivery = Delivery.find(params[:delivery_id])
		if @delivery.completed != true
			if @delivery.pieces.count != @delivery.piececount
				flash[:alert] = "Pieces in delivery must equal number of associated pieces!"
				redirect_to delivery_path(@delivery)	
			else 
				@delivery.update(completed: true)
				flash[:notice] = "Delivery has been marked as complete!"
				redirect_to delivery_path(@delivery)
			end
		else
			@delivery.update(completed: false)
			redirect_to delivery_path(@delivery)
		end
	end

	def remove
		@delivery = Delivery.find(params[:delivery_id])
		@client = @delivery.client_id
		Piece.where(id: params[:piece_ids]).update_all(location: "On Site", delivery_id: 'nil')
		redirect_to delivery_path(@delivery)
	end


	private

	def safe_delivery_params

		params.require(:delivery).permit(:date, :notes, :client_id, :piececount)

	end


end