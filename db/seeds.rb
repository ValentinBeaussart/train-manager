# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Destination.create!([name: 'Mionnay', station_code: 'A', category: 'TER'])
Destination.create!([name: 'Lyon', station_code: 'B', category: 'TER'])
Destination.create!([name: 'Paris', station_code: 'C', category: 'TGV'])
Destination.create!([name: 'Marseille', station_code: 'D', category: 'TGV'])
Destination.create!([name: 'Londres', station_code: 'E', category: 'TER'])
Destination.create!([name: 'Rome', station_code: 'F', category: 'TER'])

Train.create!([station_platform: '', arrival_time: '2024-03-11 23:25:52', departure_time: '2024-03-11 23:25:52', destination_id: 1])
Train.create!([station_platform: '', arrival_time: '2024-03-11 23:25:52', departure_time: '2024-03-11 23:25:52' , destination_id: 2])
Train.create!([station_platform: '', arrival_time: '2024-03-11 23:25:52', departure_time: '2024-03-11 23:25:52' , destination_id: 3])
Train.create!([station_platform: '', arrival_time: '2024-03-11 23:25:52', departure_time: '2024-03-11 23:25:52' , destination_id: 4])
Train.create!([station_platform: '', arrival_time: '2024-03-11 23:25:52', departure_time: '2024-03-11 23:25:52' , destination_id: 5])
Train.create!([station_platform: '', arrival_time: '2024-03-11 23:25:52', departure_time: '2024-03-11 23:25:52' , destination_id: 6])
