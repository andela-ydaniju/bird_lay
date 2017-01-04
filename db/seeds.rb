user = User.create(
  name: 'Admin',
  email: 'admin@birdlay.com',
  password: 'password',
  level: 2
)

4.times do
  user.houses.create(
    name: FFaker::Name.first_name,
    code: FFaker::Identification.ssn,
    capacity: 54_000,
    population: 34_000,
    feed_consumption: 230.45
  )
end
