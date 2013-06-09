class CreateActivityAreas < ActiveRecord::Migration
  def change
    create_table :activity_areas do |t|
      t.references :activity, index: true
      t.polygon :polygon, geographic: true
      t.index :polygon, spatial: true
    end
  end
end
