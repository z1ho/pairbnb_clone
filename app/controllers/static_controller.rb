class StaticController < ApplicationController
  before_action :require_login

  def home 
  	@recent = Listing.last   
  end
end
