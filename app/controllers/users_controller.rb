class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private


  def load_user
    @user = User.find(params[:id].to_i)
  end

  def user_params
    params.require(:user).permit(:bio, :description, :alias, :picture_avatar, :picture_artist_banner, :phone, :address, :city, :bank_account)
  end
end
