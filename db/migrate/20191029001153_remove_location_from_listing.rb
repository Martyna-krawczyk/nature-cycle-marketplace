class RemoveLocationFromListing < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :name, :string
  end
end