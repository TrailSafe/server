class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :uuid
      t.references :user
      t.timestamps
    end
    add_index :devices, :user_id
    add_index :devices, :uuid
  end
end
