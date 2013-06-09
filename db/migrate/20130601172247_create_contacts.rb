class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :type

      t.timestamps

      t.index [:id, :type]
    end
  end
end
