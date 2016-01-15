class ClientsController < ApplicationController
	
	def index

		@collection_manager = current_collection_manager	
		@clients = Client.all
		

	end

	def new
		@collection_manager = current_collection_manager
		@client = @collection_manager.clients.new
		
	end

	def create
		@collection_manager = current_collection_manager
		@client = @collection_manager.clients.create(safe_client_params)
		if @client.save
			flash[:notice] = "New Client has been created!"
			redirect_to collection_manager_clients_path(current_collection_manager)
		else
			flash[:notice] = "Error"
			render :new
		end

	end

	def show
		@client = Client.find(params[:id])
		@pieces = @client.pieces.count

	end

	private

	def safe_client_params
		params.require(:client).permit(:name, :birthday, :email, :email_assist, :cell_phone, :delivery_pref, :photo)
	end


end