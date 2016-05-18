class SearchController < ApplicationController
  
  def search
  	if params[:q].nil?
  		@listing = []
  		@tagging = []
  		@tag 	 = []
 	else
 		@listing = Listing.search(params[:q]).records
 		@tagging = Tagging.search(params[:q]).records
 		@tag 	 = Tag.search(params[:q]).records
 	end
  end
end