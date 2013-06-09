class CreateDeviceLocations < ActiveRecord::Migration
  def change
    create_table :device_locations do |t|
      t.references :device, index: true
      t.point :lonlat, geographic: true
      t.datetime :reported_at
      t.index :lonlat, spatial: true
    end
  end
end
