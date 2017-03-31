class ArtworksController < ApplicationController

  before_action :load_artwork, only: [:show, :edit, :update, :destroy, :sold]

  # you don't have to be logged in to see index or show, for the other action you have to be logged in
  skip_before_action :authenticate_account!, only: [:index, :show]
  # you also have to be an artist for the other actions (not index or show)
  # before_action :authenticate_artist!, except: [:index, :show]

  def index
    if params[:category]
      @artworks_by_category = Artwork.where(art_category: params[:category])
    else
      @artworks_by_category = Artwork.all
    end
  end

  def sold
    @artwork.sold = true
    @artwork.save
    create_purchase(@artwork)
  end

  def create_purchase(artwork)
    @purchase = Purchase.new
    @purchase.user = current_account.user
    @purchase.artwork = artwork
    @purchase.save
    redirect_to pages_thankyou_path
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
    params.require(:artwork).permit(:art_category, :description, :size, :material_description, :photo_artwork, :photo_cache, :framed, :price)
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


