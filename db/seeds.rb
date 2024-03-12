# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Destination.create!([name: 'A', station_code: 'A', category: 'A'])
Destination.create!([name: 'B', station_code: 'B', category: 'B'])
Destination.create!([name: 'C', station_code: 'C', category: 'C'])
Destination.create!([name: 'D', station_code: 'D', category: 'D'])
Destination.create!([name: 'E', station_code: 'E', category: 'E'])
Destination.create!([name: 'F', station_code: 'F', category: 'F'])
Destination.create!([name: 'G', station_code: 'G', category: 'G'])

Train.create!([station_platform: 'A', arrival_time: '2024-03-11 23:25:52', departure_time: '2024-03-11 23:25:52', destination_id: 1])
Train.create!([station_platform: 'B', arrival_time: '2024-03-11 23:25:52', departure_time: '2024-03-11 23:25:52', destination_id: 2])
Train.create!([station_platform: 'C', arrival_time: '2024-03-11 23:25:52', departure_time: '2024-03-11 23:25:52', destination_id: 3])
Train.create!([station_platform: 'D', arrival_time: '2024-03-11 23:25:52', departure_time: '2024-03-11 23:25:52', destination_id: 4])
Train.create!([station_platform: 'E', arrival_time: '2024-03-11 23:25:52', departure_time: '2024-03-11 23:25:52', destination_id: 5])
Train.create!([station_platform: 'F', arrival_time: '2024-03-11 23:25:52', departure_time: '2024-03-11 23:25:52', destination_id: 6])
Train.create!([station_platform: 'G', arrival_time: '2024-03-11 23:25:52', departure_time: '2024-03-11 23:25:52', destination_id: 7])
