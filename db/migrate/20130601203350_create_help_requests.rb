class CreateHelpRequests < ActiveRecord::Migration
  def change
    create_table :help_requests, id: :uuid do |t|
      t.uuid :device_id
      t.string :short_url
      t.boolean :emergency_contact_notified
      t.boolean :emergency_services_notified
      t.datetime :rescued_at

      t.timestamps

      t.index :emergency_contact_notified
      t.index :emergency_services_notified
      t.index :rescued_at
    end
  end
end
