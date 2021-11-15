# This code will create 1000 rows of fake data. See Gemfile.

1000.times do
	Vehicle.create({
		id: Faker::Number.between(from: 0, to: 1000000000)
	})
end