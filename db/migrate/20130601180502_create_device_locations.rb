class CreateDeviceLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.uuid :device_id
      t.point :lonlat, geographic: true
      t.timestamps
    end
  end
end
