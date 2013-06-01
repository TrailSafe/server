class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.uuid :locatable_id
      t.string :locatable_type
      t.hstore :data
      t.timestamps
    end
  end
end
