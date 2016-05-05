class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.string :country
      t.string :city
      t.string :address
      t.string :room_type
      t.string :property_type
      t.string :accomodates
      t.integer :num_of_beds
      t.integer :num_of_bathrooms

      t.timestamps null: false
    end
  end
end
