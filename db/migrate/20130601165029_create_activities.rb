class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities, id: :uuid do |t|
      t.string :name

      t.datetime :end_time
      t.boolean :completed, default: false

      t.uuid :user_id
      t.uuid :device_id

      t.timestamps

      t.index :user_id
      t.index :device_id
      t.index :completed
      t.index :end_time

    end
  end
end
