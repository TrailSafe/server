class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.point :lonlat, geographic: true
      t.datetime :reported_at
      t.references :locatable

      t.timestamps
    end
    add_index :locations, :lonlat, spatial: true
    add_index :locations, :locatable_id
  end
end
