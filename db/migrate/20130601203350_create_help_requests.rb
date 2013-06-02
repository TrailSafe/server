class CreateHelpRequests < ActiveRecord::Migration
  def change
    create_table :help_requests, id: :uuid do |t|
      t.uuid :device_id
      t.string :short_url
      t.datetime :user_notified_at
      t.datetime :emergency_contact_notified_at
      t.datetime :emergency_services_notified_at
      t.datetime :rescued_at

      t.timestamps

      t.index :user_notified_at
      t.index :emergency_contact_notified
      t.index :emergency_services_notified
      t.index :rescued_at
      t.index :short_url
    end
  end
end
