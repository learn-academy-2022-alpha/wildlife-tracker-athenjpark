class CreateSightings < ActiveRecord::Migration[7.0]
  def change
    create_table :sightings do |t|
      t.integer :animal_id
      t.datetime :date
      t.integer :latitude_degrees
      t.integer :longitude_degrees

      t.timestamps
    end
  end
end
