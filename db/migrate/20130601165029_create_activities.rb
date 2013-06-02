class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities, id: :uuid do |t|
      t.string :name

      t.datetime :end_time
      t.boolean :completed

      t.uuid :user_id
      t.uuid :device_id

      t.timestamps
    end
  end
end
