class CreateUserContacts < ActiveRecord::Migration
  def change
    create_table :user_contacts do |t|
      t.uuid :user_id
      t.uuid :contact_id

      t.timestamps
    end
  end
end
