class CreateDeviceLocations < ActiveRecord::Migration
  def change
    create_table :device_locations do |t|
      t.references :device, index: true
      t.point :latlon, geographic: true
      t.datetime :reported_at
    end
  end
end
