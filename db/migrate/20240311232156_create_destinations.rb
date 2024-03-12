class CreateDestinations < ActiveRecord::Migration[7.1]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :station_code
      t.string :category

      t.timestamps
    end
  end
end
