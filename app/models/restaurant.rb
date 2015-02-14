class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :users, through: :reservations

	# def available?(party_size)
	# 	total_reservation_count = reservation.sum(:party_size)
	# 	party_size + total_reservation_count <= capacity	
	# end

	def self.search(search)
	  if search
	    where('LOWER(name) LIKE ?', "%#{search.downcase}%")
	  else
	    self.all
	  end
	end
def track_capacity

end
end
