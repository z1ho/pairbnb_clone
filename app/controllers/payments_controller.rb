class PaymentsController < ApplicationController
  protect_from_forgery :except => [:create]
  before_action :find_reservation

  def new
    @client_token = Braintree::ClientToken.generate
  end

  def create
    nonce = params[:payment_method_nonce]
    render action: :new and return unless nonce
    @result = Braintree::Transaction.sale(
      amount: @reservation.amount,
      payment_method_nonce: "fake-valid-nonce"
    )
    @payment = Payment.new
    if @result.success?
      @payment.amount = @reservation.amount
      @payment.save
      ReservationJob.perform_later(@reservation.user_id, @reservation.listing.user_id, @reservation.id)
      redirect_to static_home_path, notice: "Payment Successful!"
    else
      redirect_to static_home_path, notice: "Transaction failed, please try again"
    end
    # reserve to save the transaction details into database
  end

  private
  def find_reservation
    @reservation = Reservation.find(params[:reservation_id])   
  end
end