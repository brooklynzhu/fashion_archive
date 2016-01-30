class PiecesController < ApplicationController
	
	def index
		@client = Client.find(params[:client_id])
		@pieces = @client.pieces.all
		if params[:search]
			@pieces = @pieces.search(params[:search])
		else
			@pieces
		end
	end

	def show
		@piece = Piece.find(params[:id])
				
	end

	def new
		@client = Client.find(params[:client_id])
		@piece = @client.pieces.new
		@pickup_id = params[:pickup_id]
	end

	def create

		@client = Client.find(params[:client_id])
		@piece = @client.pieces.create(safe_piece_params)
		@pickup = @piece.pickup.id

		if @piece.save
			flash[:notice] = "Piece has been added to #{@client.name}'s closet!"
			redirect_to pickup_path(@pickup)
		else
			flash[:alert] = "Please complete all fields."
			render :new
		end
	end

	def edit
		@piece = Piece.find(params[:id])		
	end

	def update
		@piece = Piece.find(params[:id])
		
		if @piece.update(safe_piece_params)
			flash[:notice] = "Piece Updated!"
			redirect_to piece_path(@piece)
		else
			render edit_piece_path
		end
	end


	def destroy
		@piece = Piece.find(params[:id]).destroy
		@client = @piece.client
		redirect_to client_pieces_path(@client)
	end

	def garments
		@client = Client.find(params[:client_id])
		@garments = @client.pieces.where(category: "Garments")
	end

	def bags
		@client = Client.find(params[:client_id])
		@bags = @client.pieces.where(category: "Bags")
	end

	def shoes
		@client = Client.find(params[:client_id])
		@shoes = @client.pieces.where(category: "Shoes")
	end

	def accessories
		@client = Client.find(params[:client_id])
		@accessories = @client.pieces.where(category: "Accessories")
	end

	

	private

	def safe_piece_params
		params.require(:piece).permit(:designer, :description, :size, :color, :pattern, :material, :category, :sub_category, :location, :condition, :photo, :pickup_id, :delivery_id)
	end


end