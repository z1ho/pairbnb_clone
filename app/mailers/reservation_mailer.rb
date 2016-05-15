class ReservationMailer < ApplicationMailer

 	def booking_email(customer_id, host_id, reservation_id)
 	# byebug
 		@customer = User.find(customer_id)
 		@host = User.find(host_id)
 		@reservation = Reservation.find(reservation_id)
 		@listing_id = @reservation.listing_id
 		@listing = @reservation.listing
 		@url = "http://localhost:3000/listings/#{@listing_id}/reservations/#{reservation_id}"
 		mail(to: @customer.email, subject: 'Thanks for booking with ZB&B')
 	end
 end
