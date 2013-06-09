class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :uuid
      t.references :user, index: true
      t.timestamps
    end
  end
end
