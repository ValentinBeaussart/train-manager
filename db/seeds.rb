# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Destination.create!([name: 'Vienne', station_code: '1', category: 'TER'])
Destination.create!([name: 'Bourg-en-Bresse', station_code: '2', category: 'TER'])
Destination.create!([name: 'Villars-les-Dombes', station_code: '3', category: 'TER'])
Destination.create!([name: 'Marseille', station_code: '4', category: 'TGV'])
Destination.create!([name: 'Londres', station_code: '5', category: 'TGV'])
Destination.create!([name: 'Rome', station_code: '6', category: 'TGV'])
