class MusicalPiecesController < ApplicationController
  before_action :set_musical_piece, only: %i[ show edit update destroy ]

  # GET /musical_pieces or /musical_pieces.json
  def index
    @musical_pieces = MusicalPiece.all
  end

  # GET /musical_pieces/1 or /musical_pieces/1.json
  def show
  end

  # GET /musical_pieces/new
  def new
    @musical_piece = MusicalPiece.new
  end

  # GET /musical_pieces/1/edit
  def edit
  end

  # POST /musical_pieces or /musical_pieces.json
  def create
    @musical_piece = MusicalPiece.new(musical_piece_params)

    respond_to do |format|
      if @musical_piece.save
        format.html { redirect_to @musical_piece, notice: "Musical piece was successfully created." }
        format.json { render :show, status: :created, location: @musical_piece }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @musical_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /musical_pieces/1 or /musical_pieces/1.json
  def update
    respond_to do |format|
      if @musical_piece.update(musical_piece_params)
        format.html { redirect_to @musical_piece, notice: "Musical piece was successfully updated." }
        format.json { render :show, status: :ok, location: @musical_piece }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @musical_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musical_pieces/1 or /musical_pieces/1.json
  def destroy
    @musical_piece.destroy!

    respond_to do |format|
      format.html { redirect_to musical_pieces_path, status: :see_other, notice: "Musical piece was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_musical_piece
      @musical_piece = MusicalPiece.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def musical_piece_params
      params.require(:musical_piece).permit(:name)
    end
end
