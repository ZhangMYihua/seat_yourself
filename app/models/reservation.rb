class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant

	def space_available
		restaurant.reservations
							.where('booking = ?', booking).map(&:party_size).sum
							# Reservation.all.select{|x| x.booking.hour == 16 }.	
	end

	def restaurant_open?
		# .where('booking BETWEEN ? AND ?', restaurant.opens_at, restaurant.closes_at)
		booking.between?(restaurant.opens_at, restaurant.closes_at)
	end

private
	def availability
			if !restaurant.available?(party_size)
				errors.add(:base, "Restaurant is full for this time")
		end	
	end
end
