class ArtworksController < ApplicationController

  before_action :load_artwork, only: [:show, :edit, :update, :destroy]

  # you don't have to be logged in to see index or show, for the other action you have to be logged in
  skip_before_action :authenticate_account!, only: [:index, :show]
  # you also have to be an artist for the other actions (not index or show)
  # before_action :authenticate_artist!, except: [:index, :show]

  def index
    @artworks = Artwork.all
  end

  def show
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user = current_account.user
    if @artwork.save
      redirect_to artworks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @artwork = Artwork.new(artwork_params)
    @artwork.user = current_account.user
    if @artwork.save
      redirect_to artworks_path
    else
      render :edit
    end
  end

  def destroy
    @artwork.destroy
    redirect_to :back
  end

  private

  def artwork_params
    params.require(:artwork).permit(:art_category, :description, :size, :material_description, :photo_artwork, :photo_cache, :framed)
  end

   def load_artwork
    @artwork = Artwork.find(params[:id])
  end

  def authenticate_artist!
    unless current_account.user.artist
      flash[:error] = "You are not an artist, please sign up as an artist first"
      redirect_to artworks_path
    end
  end
end


