class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy, :preview]

  layout :change_layout

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)

    if @image.save
      # @image.avatar.attach(params[:image][:avatar]) if params[:image][:avatar]
      # @image.avatar.attach(params[:image][:multi_images]) if params[:image][:multi_images]
      flash[:notice] = "L'image a été créée avec succès."
      redirect_to images_path
    else
      redirect_to new_image_path
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    @image.update(image_params)
    redirect_to images_path, notice: "L'image a été mise à jour avec succès."
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    redirect_to images_path, notice: "L'image a été supprimée avec succès."
  end

  def preview
    @image = @image.search(params[:keywords]) if params[:keywords]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:name, :number_bands, :spectrum, :bandwidth, :year, :description, :avatar, :category_id, :amount, :camera_id, multi_images: [])
    end

    def change_layout
      if %w[preview].include? action_name
        'home'
      else
        'dashboard'
      end
    end
end
