# This is where you can create initial data for your app.


# puts 'Creating restaurants...'
# tour_d_argent = Restaurant.new(name: "La Tour d'Argent")
# tour_d_argent.save!

# chez_gladines = Restaurant.new(name: "Chez Gladines")
# chez_gladines.save!
# puts 'Finished!'

require 'faker'

100.times do
  address = Faker::Address.full_address
  name = Faker::Company.name
  Restaurant.create(
    name: name,
    address: address
  )
end
