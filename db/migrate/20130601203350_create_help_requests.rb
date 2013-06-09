class CreateHelpRequests < ActiveRecord::Migration
  def change
    create_table :help_requests do |t|
      t.references :device, index: true
      t.string :invoked_by
      t.string :short_url
      t.datetime :user_alerted_at
      t.datetime :emergency_contact_alerted_at
      t.datetime :services_alerted_at
      t.datetime :rescued_at

      t.timestamps

      t.index :invoked_by
      t.index :user_alerted_at
      t.index :emergency_contact_alerted_at
      t.index :services_alerted_at
      t.index :rescued_at
      t.index :short_url
    end
  end
end
