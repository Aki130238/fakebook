class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
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

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "userを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice:"userを削除しました！"
  end

  def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image_user)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
