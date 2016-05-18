class StaticController < ApplicationController
  before_action :require_login

  def home 
  	@trips = Reservation.where(user_id: current_user).order(start_date: :desc)
	@recent_trips = @trips.where('start_date >= ?', Date.current)
	@previous_trips = @trips.where('start_date < ?', Date.current)
  end
  
end
