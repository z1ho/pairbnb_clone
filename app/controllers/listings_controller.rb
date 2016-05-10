class ListingsController < ApplicationController
  def index   
    @user = current_user
    if params[:tag]
      @listings = Listing.tagged_with(params[:tag])
    else
      @listings = Listing.all
    end
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
    @listing.update(listing_params)
      if @listing.save
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
    params.require(:listing).permit(:name, :description, :country, :city, :address, :room_type, :property_type, :accomodates, :num_of_beds, :num_of_bathrooms, :price, :tag_list)
  end
end
