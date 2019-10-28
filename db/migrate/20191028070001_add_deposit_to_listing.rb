class AddDepositToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :deposit, :integer
  end
end
