class TopsController < ApplicationController
  def index
    @user = User.new
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    # @user.image_user.retrieve_from_cache! params[:cache][:image_user]#carriewave設定
    if params[:back]
      render 'new'
    else
      if @user.save
        redirect_to user_path(@user.id), notice: "userを作成しました！"
      else
        render 'new'
      end
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image_user)
  end

end
