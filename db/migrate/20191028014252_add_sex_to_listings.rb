class AddSexToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :sex, :integer
  end
end
