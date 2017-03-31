class PagesController < ApplicationController

  skip_before_action :authenticate_account!

  def home
    @users = User.all.where(artist: true)
  end

  def thankyou

  end

end

