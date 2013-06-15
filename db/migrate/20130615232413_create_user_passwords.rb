class CreateUserPasswords < ActiveRecord::Migration
  def change
    create_table :user_passwords do |t|
      t.references :user
      t.string :digest
      t.timestamps
    end
    add_index :user_passwords, :user_id
  end
end
