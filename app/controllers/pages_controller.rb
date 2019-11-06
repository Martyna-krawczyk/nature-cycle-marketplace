class PagesController < ApplicationController
  
  def home
    
  end 

  def admin
    authorize! :admin, @listings
  end 

  def user
    # authorize! :user, @listings
  end 
  
end

