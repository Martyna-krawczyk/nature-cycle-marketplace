ActiveAdmin.register Listing do

  permit_params :title, :description, :colour_id, :make_id, :size_id, :condition_id, :sold, :picture, :sex, :price, :deposit, :location
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :title, :description, :colour_id, :make_id, :size_id, :condition_id, :sold, :sex, :price, :deposit, :location
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :title, :description, :colour_id, :make_id, :size_id, :condition_id, :sold, :sex, :price, :deposit, :location]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
