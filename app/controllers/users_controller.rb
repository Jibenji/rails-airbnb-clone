class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @user.update_attributes(user_params)
    #@user.save
    redirect_to artworks_path
  end

  private
  def load_user
    @user = current_account.user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :description, :alias, :photo_avatar, :photo_artist_banner, :phone, :address, :city, :bank_account)
  end
end
