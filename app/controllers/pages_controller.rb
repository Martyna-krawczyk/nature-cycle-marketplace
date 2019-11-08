class PagesController < ApplicationController
  
  def home
    Listing.all
    @recent = Listing.where(sold: 2).last(3)
  end 

  def admin
    authorize! :admin, @listings
  end 

  def user
    if !user_signed_in?
      redirect_to '/404.html'
    end
  end 
  
end

