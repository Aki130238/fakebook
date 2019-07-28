class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    @picture.image_pict.retrieve_from_cache! params[:cache][:image_pict]#carriewave設定
    if params[:back]
      render 'new'
    else
      if @picture.save
        redirect_to pictures_path, notice: "Pictureを作成しました！"
      else
        render 'new'
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "Pictureを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice:"Pictureを削除しました！"
  end

  def confirm
    @picture = current_user.pictures.new(picture_params)
    @picture.image_pict.cache! #carriewave設定
    render :new if @picture.invalid?
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :content, :image_pict, :image_cache)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
