class CreateActivityAreas < ActiveRecord::Migration
  def change
    create_table :activity_areas do |t|
      t.references :activity, index: true
      t.polygon :poly, geographic: true
    end
  end
end
