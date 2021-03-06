class ListingsController < ApplicationController
  def index
    @listings = Listing.all
    @user = current_user
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = current_user.listings.new(listing_params)
    @listing.save
    redirect_to listings_path
  end

  def update
    @listing = Listing.find(params[:id])
      if @listing.update(listing_params)
        redirect_to listings_path
      else
        flash[:warning] = "Error"  
        render :edit
      end      
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  private
  def listing_params
    params.require(:listing).permit(:name, :description, :country, :city, :address, :room_type, :property_type, :accomodates, :num_of_beds, :num_of_bathrooms)
  end
end
