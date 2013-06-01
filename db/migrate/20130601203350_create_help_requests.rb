class CreateHelpRequests < ActiveRecord::Migration
  def change
    create_table :help_requests, id: :uuid do |t|
      t.uuid :device_id
      t.string :short_url
      t.timestamps
    end
  end
end
