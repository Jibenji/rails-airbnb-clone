class PurchasesController < ApplicationController
  def index
    @purchases = User.find(current_account.user).purchases
  end
end
