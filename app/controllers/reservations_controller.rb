class ReservationsController < ApplicationController

  before_action :find_reservation, only: [:show, :edit, :update, :destroy]

  def new
    @reserve = Reservation.new
  end

  def index
    @listing = Listing.find(params[:listing_id])
      unless current_user.reservations == nil
       @reserve = Reservations.find(params[:id])
      end
  end

  def show
    @listing = @reserve.listing
  end

  def create
    # byebug
    @listing = Listing.find(params[:listing_id])      

    date = params[:reservation][:dates]

    split_date = date.split(' - ')
               
    start_date_date = split_date[0]
    end_date_date = split_date[1]
    # byebug
    start_date = DateTime.parse(start_date_date).strftime("%d-%m-%Y")
    end_date = DateTime.parse(end_date_date).strftime("%d-%m-%Y")

    @reserve = Reservation.new(start_date: start_date, end_date: end_date, listing_id: params[:reservation][:listing_id])
    @reserve.user_id = current_user.id
    @customer = @reserve.user
    @host = User.find(@reserve.listing.user_id)
    # byebug
    if @reserve.save
      ReservationMailer.booking_email(@customer, @host, @reserve).deliver_now
      redirect_to listing_reservation_path(params[:listing_id], @reserve)
    else
      flash.now[:warning] = "Date is unavailable, perhaps another?"
      render :show
    end
  end

  def edit
  end

  def update
      if @reserve.update(reserve_params)
        redirect_to reservations_index_path
      else
        flash[:warning] = "You sure bout this update?"
        render :index
      end
  end

  def destroy
    @reserve.destroy
    redirect_to reservations_index_path
  end

  private

  def find_reservation
    @reserve = Reservation.find(params[:id])
  end

  def reserve_params
    params.require(:reservation).permit(
      :user_id, :listing_id,
      :dates
      )
  end

end
