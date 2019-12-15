class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :update, :destroy]
  before_action :set_album, only: [:new, :create]
  before_action :authenticate_user!

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @picture = @album.pictures.new
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = @album.pictures.new(picture_params)

    respond_to do |format|
      if @picture.save
        format.html { redirect_to album_picture_path(@album, @picture), notice: I18n.t('pictures.create.success') }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to album_path, notice: I18n.t('pictures.destroy.success') }
      format.js   { flash[:notice] = I18n.t('pictures.destroy.success'); render inline: "location.reload();"}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end
    #
    def set_album
      @album = Album.find_by(id: params[:album_id]) || Album.find(picture_params[:album_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:album_id, :title, :image, :date)
    end
end
