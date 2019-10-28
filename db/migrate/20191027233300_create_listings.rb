class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.references :colour, foreign_key: true
      t.references :make, foreign_key: true
      t.references :size, foreign_key: true
      t.references :condition, foreign_key: true
      t.references :location, foreign_key: true
      t.integer :sold

      t.timestamps
    end
  end
end
