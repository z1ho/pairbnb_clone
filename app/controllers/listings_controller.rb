class ListingsController < ApplicationController
  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    @listing.save
    redirect_to listings_path
  end

  def index
    @listings = Listing.all
  end

  def show
    @listings = Listing.all
  end

  private
  def listing_params
    params.require(:listing).permit(:name, :description, :country, :city, :address, :room_type, :property_type, :accomodates, :num_of_beds, :num_of_bathrooms)
  end
end
