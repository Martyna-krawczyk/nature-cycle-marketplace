class RemoveLocationFromListing < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :location, :string
  end
end
