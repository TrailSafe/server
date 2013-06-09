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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130609194556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "activities", force: true do |t|
    t.string   "name"
    t.boolean  "completed",    default: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "alert_buffer"
    t.integer  "device_id"
    t.integer  "user_id"
  end

  add_index "activities", ["completed"], :name => "index_activities_on_completed"
  add_index "activities", ["device_id"], :name => "index_activities_on_device_id"
  add_index "activities", ["end_time"], :name => "index_activities_on_end_time"
  add_index "activities", ["start_time"], :name => "index_activities_on_start_time"
  add_index "activities", ["user_id"], :name => "index_activities_on_user_id"

  create_table "activity_areas", force: true do |t|
    t.integer "activity_id"
    t.spatial "polygon",     limit: {:srid=>4326, :type=>"polygon", :geographic=>true}
  end

  add_index "activity_areas", ["activity_id"], :name => "index_activity_areas_on_activity_id"
  add_index "activity_areas", ["polygon"], :name => "index_activity_areas_on_polygon", :spatial => true

  create_table "alerts", force: true do |t|
    t.integer  "help_request_id"
    t.datetime "alerted_at"
  end

  add_index "alerts", ["help_request_id"], :name => "index_alerts_on_help_request_id"

  create_table "contacts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["id", "type"], :name => "index_contacts_on_id_and_type"

  create_table "device_locations", force: true do |t|
    t.integer  "device_id"
    t.spatial  "lonlat",      limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.datetime "reported_at"
  end

  add_index "device_locations", ["device_id"], :name => "index_device_locations_on_device_id"
  add_index "device_locations", ["lonlat"], :name => "index_device_locations_on_lonlat", :spatial => true

  create_table "devices", force: true do |t|
    t.string   "uuid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "devices", ["user_id"], :name => "index_devices_on_user_id"

  create_table "help_requests", force: true do |t|
    t.integer  "device_id"
    t.string   "invoked_by"
    t.string   "short_url"
    t.datetime "user_alerted_at"
    t.datetime "emergency_contact_alerted_at"
    t.datetime "services_alerted_at"
    t.datetime "rescued_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "help_requests", ["device_id"], :name => "index_help_requests_on_device_id"
  add_index "help_requests", ["emergency_contact_alerted_at"], :name => "index_help_requests_on_emergency_contact_alerted_at"
  add_index "help_requests", ["invoked_by"], :name => "index_help_requests_on_invoked_by"
  add_index "help_requests", ["rescued_at"], :name => "index_help_requests_on_rescued_at"
  add_index "help_requests", ["services_alerted_at"], :name => "index_help_requests_on_services_alerted_at"
  add_index "help_requests", ["short_url"], :name => "index_help_requests_on_short_url"
  add_index "help_requests", ["user_alerted_at"], :name => "index_help_requests_on_user_alerted_at"

  create_table "user_contacts", force: true do |t|
    t.integer  "user_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_contacts", ["contact_id"], :name => "index_user_contacts_on_contact_id"
  add_index "user_contacts", ["user_id"], :name => "index_user_contacts_on_user_id"

end
