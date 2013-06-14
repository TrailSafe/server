class CreateUserEmergencyContacts < ActiveRecord::Migration
  def change
    create_table :user_emergency_contacts do |t|
      t.references :user
      t.references :contact

      t.timestamps
    end
    add_index :user_emergency_contacts, :user_id
    add_index :user_emergency_contacts, :contact_id
  end
end
