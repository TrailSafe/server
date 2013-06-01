class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities, id: :uuid do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.integer :return_buffer_hours
      t.boolean :completed

      t.timestamps
    end
  end
end
