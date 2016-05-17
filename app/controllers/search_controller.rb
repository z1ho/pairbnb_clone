class SearchController < ApplicationController
  
  def search
  	@listings = Listing.search(params[:search])
  end
end