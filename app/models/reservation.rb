class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing

	validate :unique_date

	def dates
	end

private

	def unique_date
	errors.add(:start_date, "is not available") unless listing.reservations.where("? >= start_date AND ? <= end_date",
		start_date, start_date).count == 0
	errors.add(:end_date, "is not available") unless listing.reservations.where("? >= start_date AND ? <= end_date",
		end_date, end_date).count == 0
	end

end