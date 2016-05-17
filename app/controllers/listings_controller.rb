class ListingsController < ApplicationController
  def index   
    @user = current_user
    if params[:tag]
      @listings = Listing.tagged_with(params[:tag])
      # @listings.order(updated_at: :desc)
    else
      @listings = Listing.all
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @user == current_user
    @reserve = @listing.reservations.new
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
        flash[:success] = "Succesfully updated!"
      else
        flash[:warning] = "Error, no modifications made. Please try again."  
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
    params.require(:listing).permit(:name, :description, :country, :city, :address, :room_type, :property_type, :accomodates, :num_of_beds, :num_of_bathrooms, :price, :tag_list, {image: []})
  end
end
