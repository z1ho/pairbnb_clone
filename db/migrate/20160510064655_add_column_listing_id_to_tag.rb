class AddColumnListingIdToTag < ActiveRecord::Migration
  def change
  	add_column :tags, :listing_id, :integer
  end
end
