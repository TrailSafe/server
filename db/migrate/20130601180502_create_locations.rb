class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.uuid :locatable_id
      t.string :locatable_type
      t.float :lat
      t.float :lng
      t.float :radius
      t.timestamps

      t.index [:locatable_id, :locatable_type]
      t.index :lat
      t.index :lng
      t.index :radius
    end
  end
end
