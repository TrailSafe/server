class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.boolean :completed, default: false
      t.datetime :start_time
      t.datetime :end_time
      t.integer :alert_buffer

      t.references :device, index: true
      t.references :user, index: true

      t.index :completed
      t.index :start_time
      t.index :end_time

    end
  end
end
