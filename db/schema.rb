# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130615232413) do

  create_table "contacts", :force => true do |t|
    t.string   "type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "devices", :force => true do |t|
    t.string   "uuid"
    t.datetime "verified_on"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "devices", ["user_id"], :name => "index_devices_on_user_id"
  add_index "devices", ["uuid"], :name => "index_devices_on_uuid"

  create_table "locations", :force => true do |t|
    t.spatial  "lonlat",       :limit => {:srid=>4326, :type=>"point", :geographic=>true}
    t.datetime "reported_at"
    t.integer  "locatable_id"
    t.datetime "created_at",                                                               :null => false
    t.datetime "updated_at",                                                               :null => false
  end

  add_index "locations", ["locatable_id"], :name => "index_locations_on_locatable_id"
  add_index "locations", ["lonlat"], :name => "index_locations_on_lonlat", :spatial => true

  create_table "user_emergency_contacts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "contact_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_emergency_contacts", ["contact_id"], :name => "index_user_emergency_contacts_on_contact_id"
  add_index "user_emergency_contacts", ["user_id"], :name => "index_user_emergency_contacts_on_user_id"

  create_table "user_passwords", :force => true do |t|
    t.integer  "user_id"
    t.string   "digest"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_passwords", ["user_id"], :name => "index_user_passwords_on_user_id"

end
