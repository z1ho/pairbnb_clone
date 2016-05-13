class AddImageToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :image, :json
  end
end
