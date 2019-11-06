class PagesController < ApplicationController
  
  def home
    @recent = Listing.last(3)
  end 

  def admin
    authorize! :admin, @listings
  end 

  def user
    if !user_signed_in?
      redirect_to '/404.html'
    end
    # authorize! :user, @listings
  end 
  
end

