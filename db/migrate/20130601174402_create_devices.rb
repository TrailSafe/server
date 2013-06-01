class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices, id: :uuid do |t|
      t.uuid :user_id

      t.timestamps
    end
  end
end
