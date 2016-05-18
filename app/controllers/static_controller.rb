class StaticController < ApplicationController
  before_action :require_login

  def home 
  	@user_trips = Reservation.where(user_id: current_user)
	@recent_trip = Reservation.order(start_date: :desc)
	@recent_trip.each do |r| 
	@current_date = Date.current
	end
  end
  
end
