class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.where(artist: true)
    end
  end

  def show
    @artworks = current_account.user.artworks
  end

  def edit
  end

  def update
    @user.update_attributes(user_params)
    redirect_to root_path
  end

  private
  def load_user
    @user = current_account.user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :artist, :bio, :description, :alias, :photo_artists_banner, :phone, :address, :city, :bank_account, :photo_artists_banner_cache, :photo_avatar, :photo_avatar_cache)
  end
end

