class MinimagesController < ApplicationController
  include ResizingConcern
  skip_before_action :verify_authenticity_token
  before_action :set_minimage, only: %i[ show edit update destroy ]
  before_action lambda { params[:image] = resizing_image(params[:image]) }, only: :create
  before_action lambda { params[:base64] = base64_image(params[:image]) }, only: :create

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
    if @minimage.save
      redirect_to minimages_url, notice: "Minimage was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /minimages/1 or /minimages/1.json
  def update
    if @minimage.update(minimage_params)
      redirect_to minimage_url(@minimage), notice: "Minimage was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /minimages/1 or /minimages/1.json
  def destroy
    @minimage.destroy

    redirect_to minimages_url, notice: "Minimage was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minimage
      @minimage = Minimage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def minimage_params
      params.permit(
        :title,
        :description,
        :image,
        :base64,
        images: []
      )
    end
end
