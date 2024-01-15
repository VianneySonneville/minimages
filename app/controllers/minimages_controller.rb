class MinimagesController < ApplicationController
  before_action :set_minimage, only: %i[ show edit update destroy ]

  # GET /minimages or /minimages.json
  def index
    @minimages = Minimage.all
  end

  # GET /minimages/1 or /minimages/1.json
  def show
  end

  # GET /minimages/new
  def new
    @minimage = Minimage.new
  end

  # GET /minimages/1/edit
  def edit
  end

  # POST /minimages or /minimages.json
  def create
    @minimage = Minimage.new(minimage_params)

    respond_to do |format|
      if @minimage.save
        format.html { redirect_to minimage_url(@minimage), notice: "Minimage was successfully created." }
        format.json { render :show, status: :created, location: @minimage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @minimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minimages/1 or /minimages/1.json
  def update
    respond_to do |format|
      if @minimage.update(minimage_params)
        format.html { redirect_to minimage_url(@minimage), notice: "Minimage was successfully updated." }
        format.json { render :show, status: :ok, location: @minimage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @minimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minimages/1 or /minimages/1.json
  def destroy
    @minimage.destroy

    respond_to do |format|
      format.html { redirect_to minimages_url, notice: "Minimage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minimage
      @minimage = Minimage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def minimage_params
      params.require(:minimage).permit(
        :image,
        images: []
      )
    end
end
