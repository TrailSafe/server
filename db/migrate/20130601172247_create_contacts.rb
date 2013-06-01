class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number

      t.timestamps
    end
  end
end
