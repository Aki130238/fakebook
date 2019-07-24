class PicturesController < ApplicationController
  def index
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(title: params[:picture][:title], content: params[:picture][:content], image_pict: params[:picture][:image_pict])
    redirect_to new_picture_path
  end
end
