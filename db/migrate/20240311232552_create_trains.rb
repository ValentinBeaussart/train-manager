class CreateTrains < ActiveRecord::Migration[7.1]
  def change
    create_table :trains do |t|
      t.string :platform
      t.datetime :arrival_time
      t.datetime :departure_time
      t.references :destination, null: false, foreign_key: true
    end
  end
end
