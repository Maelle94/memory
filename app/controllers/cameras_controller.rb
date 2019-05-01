class CamerasController < ApplicationController
  before_action :set_camera, only: [:show, :edit, :update, :destroy, :preview]

  layout :change_layout

  # GET /cameras
  # GET /cameras.json
  def index
    @cameras = Camera.all
  end

  # GET /cameras/1
  # GET /cameras/1.json
  def show
  end

  # GET /cameras/new
  def new
    @camera = Camera.new
  end

  # GET /cameras/1/edit
  def edit
  end

  # POST /cameras
  # POST /cameras.json
  def create
    @camera = Camera.new(camera_params)

    if @camera.save
      @camera.avatar.attach(params[:camera][:avatar]) if params[:camera][:avatar]
      flash[:notice] = 'La caméra a été créée avec succès.'
      redirect_to cameras_path
    else
      redirect_to new_camera_path
    end
  end

  # PATCH/PUT /cameras/1
  # PATCH/PUT /cameras/1.json
  def update
    @camera.update(camera_params)
    redirect_to cameras_path, notice: 'La caméra a été mise à jour avec succès.'
  end

  # DELETE /cameras/1
  # DELETE /cameras/1.json
  def destroy
    @camera.destroy
    redirect_to cameras_path, notice: 'La caméra a été supprimée avec succès.'
  end

  def preview
    @categories = Category.all
    @camera = @camera.search(params[:keywords]) if params[:keywords]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camera
      @camera = Camera.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camera_params
      params.require(:camera).permit(:name, :number_bands, :number_channels, :wave_length, :dimension, :bandwidth, :year, :description, :avatar)
    end

    def change_layout
      if %w[preview].include? action_name
        'home'
      else
        'dashboard'
      end
    end
end
