class ClientsController < ApplicationController
	
	def index
		@collection_manager = current_collection_manager
		@clients = @collection_manager.clients.all
		if params[:search]
			@clients = @clients.search(params[:search])
		else
			@clients
		end
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
			flash[:alert] = "Please complete form."
			render :new
		end

	end

	def edit
		@client = Client.find(params[:id])

	end

	def update
		@client = Client.find(params[:id])
		
		if @client.update(safe_client_params)
			flash[:notice] = "Client Updated!"
			redirect_to client_profile_path(@client)
		else
			render edit_client_path
		end

	end

	def destroy
		@client = Client.find(params[:id]).destroy
		redirect_to collection_manager_clients_path(current_collection_manager)
	end

	def show
		@client = Client.find(params[:id])
		@piece_count = @client.pieces.count
		@pieces_on_site = @client.pieces.where(location: 'On Site')
		@pieces_at_client = @client.pieces.where(location: 'At Client').count

	end

	def profile
		@client = Client.find(params[:client_id])
		@pieces_on_site = @client.pieces.where(location: 'On Site')
		@pieces_at_client = @client.pieces.where(location: 'At Client').count
		@piece_count = @client.pieces.count
		

	end

	private

	def safe_client_params
		params.require(:client).permit(:name, :birthday, :email, :email_assist, :cell_phone, :delivery_pref, :photo)
	end


end