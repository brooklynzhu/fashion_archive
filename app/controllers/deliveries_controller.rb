class DeliveriesController < ApplicationController


	def index
		@client = Client.find(params[:client_id])
		@deliveries = Delivery.all

	end

	def show
		@delivery = Delivery.find(params[:id])
		@client_name = @delivery.client.name
		@client_id = @delivery.client_id

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
			flash[:notice] = "Error!"
			render :new
		end
	end

	def check_out


	end

	def complete_check_out

	end

private

private

	def safe_delivery_params

		params.require(:delivery).permit(:date, :notes, :client_id, :piececount)

	end


end