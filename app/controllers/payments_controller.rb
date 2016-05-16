class PaymentsController < ApplicationController
  before_action do_some_security_activity_available, only: [:new, :create]

  def new
    @client_token = Braintree::ClientToken.generate
    @reservation = Reservation.find_by(secure_token: params[:secure_token])
    @payment = Payment.new
  end

  def create
    nonce = params[:payment_method_nonce]
    render action: :new and return unless nonce
    result = Braintree::Transaction.sale(
      amount: "10.00",
      payment_method_nonce: params[:payment_method_nonce]
    )

    # reserve to save the transaction details into database

    redirect_to reservations_path
  end

  ...

end