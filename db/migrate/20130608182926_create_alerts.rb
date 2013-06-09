class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.references :help_request, index: true
      t.datetime :alerted_at
    end
  end
end
