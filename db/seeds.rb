
def random_hour(from, to)
  (rand(10).days.from_now + rand(from..to).hour + rand(0..60).minutes).to_datetime
end

puts "\nCreating users"
100.times do
	User.create!(
		email: Faker::Internet.email,
		name:  Faker::Name.name,
		password: "asdf;lkj"
	)
	print "|"
end

puts "\nCreating restaurants"
50.times do
	name = "#{["Bob's", "Eddy's", "Sue's", "Charleses"].sample} #{["Fried", "Baked", "Stewed"].sample} #{["Chicken", "Pies", "Sandwiches", "Soup's"].sample}"
	Restaurant.create!(
		name: name,
		capacity: [20, 40, 60, 200].sample,
		opens_at: random_hour(9, 12),
		closes_at: random_hour(16, 20),
		description: Faker::Company.catch_phrase,
		address: Faker::Address.street_address,
		phone: Faker::PhoneNumber.phone_number
	)
	print "|"
end

puts "\nCreating reservations"
1000.times do
	Reservation.create!(
		party_size: [1,3,4,6,10].sample,
		booking: random_hour(9, 18),
		user_id: User.all.sample.id,
		restaurant_id: Restaurant.all.sample.id
	)
	print "|"
end