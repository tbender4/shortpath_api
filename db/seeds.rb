# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

building = Building.create!({ name: 'Test Building' })
building.floors << Floor.create!({ name: '1st floor', flevel: 1, building: })
building.floors << Floor.create!({ name: '2nd floor', flevel: 2, building: })
building.floors.each.with_index(1) do |floor, index|
  floor.spaces << Space.create!({ name: "#{index}00", floor: })
end
puts building.inspect
puts building.floors.inspect
building.floors.each { |f| f.spaces.each { |s| puts s.inspect } }

group = Group.create({ name: 'Test Group' })
puts group.inspect
building.spaces.each do |space|
  puts Lease.create(group:, space:).inspect
end

# VisitorType.create({ name: 'Visitor', building: })

user = User.create(email: 'admin@sv3.com', password: SecureRandom.alphanumeric,
                   contact_attributes: { first_name: 'Admin', last_name: 'User' })
puts user.inspect
puts user.contact.inspect
user.add_role :superuser
puts user.roles.inspect
