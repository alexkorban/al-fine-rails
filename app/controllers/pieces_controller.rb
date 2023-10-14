class PiecesController < ApplicationController
  def index  
    @pieces = Piece.all
    @piece = Piece.new
  end 

  def create
    @piece = Piece.new(piece_params())

    respond_to do |format|
      if @piece.save
        format.html { redirect_to pieces_url, notice: "New piece added" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @piece = Piece.find(params[:id])
  end

  def update
    @piece = Piece.find(params[:id])
    respond_to do |format|
      if @piece.update(piece_params)
        format.html { redirect_to pieces_url, notice: "Piece updated successfully" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @piece = Piece.find(params[:id])
    @piece.destroy
    redirect_to pieces_url, notice: "Piece deleted successfully"
  end

  def toggle
    @piece = Piece.find(params[:id])
    updated_practices = @piece.practices
    updated_practices[params[:index].to_i()] = params[:practice]
    @piece.update!(date: Date.today(), practices: updated_practices)

    render json: { message: "Success" }
  end


  private

  def piece_params
    params.require(:piece).permit(:name)
  end  
end

