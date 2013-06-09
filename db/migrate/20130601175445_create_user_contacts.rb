class CreateUserContacts < ActiveRecord::Migration
  def change
    create_table :user_contacts do |t|
      t.references :user, index: true
      t.references :contact, index: true
      t.timestamps
    end
  end
end
