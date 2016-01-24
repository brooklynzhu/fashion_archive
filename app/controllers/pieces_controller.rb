class PiecesController < ApplicationController
	
	def index
		@client = Client.find(params[:client_id])
		@pieces = @client.pieces.all
		if params[:search]
			@pieces = Piece.search(params[:search])
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

		if @piece.save
			flash[:notice] = "Piece has been added to #{@client.name}'s closet!"
			redirect_to piece_path(@piece)
		else
			flash[:notice] = "Error"
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

	

	private

	def safe_piece_params
		params.require(:piece).permit(:designer, :description, :size, :color, :pattern, :material, :category, :sub_category, :location, :condition, :photo, :pickup_id, :delivery_id)
	end


end