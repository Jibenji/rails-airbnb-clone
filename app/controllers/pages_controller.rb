class PagesController < ApplicationController

  skip_before_action :authenticate_account!

  def home
    @artworks = Artwork.all
  end

  def thankyou

  end

end

