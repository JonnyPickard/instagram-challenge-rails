class ImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @images = Image.all.where(user_id: current_user.id)
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    if @image.save
      redirect_to images_path, notice: 'Image was successfully uploaded.'
    else
      redirect_to new_image_path
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @image.update(image_params)

    redirect_to '/images'
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Image Deleted"
    redirect_to '/images'
  end

  def image_params
    params.require(:image).permit(:title, :description, :picture)
  end
end
