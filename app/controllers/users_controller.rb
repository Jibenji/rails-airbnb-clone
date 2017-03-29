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

  private
  def load_user
    @user = current_account.user
  end

  def user_params
    params.require(:user).permit(:bio, :description, :alias, :picture_avatar, :picture_artist_banner, :phone, :address, :city, :bank_account)
  end
end