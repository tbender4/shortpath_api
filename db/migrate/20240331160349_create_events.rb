class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :subject
      t.string :description
      t.references :group, null: false, foreign_key: true
      t.references :locationable, null: false, foreign_key: true # NOTE: locationable, not location!!
      t.string :special_instructions
      t.string :rrule_data
      t.string :string

      t.timestamps
    end
  end
end


# create_table "events", :force => true do |t|
#   t.string   "subject"
#   t.text     "description"
#   t.integer  "group_id"
#   t.integer  "location_id"            # NOTE: We're renaming this column to locationable!!
#   t.integer  "created_by_user_id"
#   t.integer  "updated_by_user_id"
#   t.string   "state"
#   t.boolean  "all_day"
#   t.integer  "repeats"
#   t.integer  "repeat_every"
#   t.boolean  "sunday"
#   t.boolean  "monday"
#   t.boolean  "tuesday"
#   t.boolean  "wednesday"
#   t.boolean  "thursday"
#   t.boolean  "friday"
#   t.boolean  "saturday"
#   t.datetime "start_time"
#   t.datetime "end_time"
#   t.date     "range_start"
#   t.date     "range_end"
#   t.text     "special_instructions"
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.datetime "deleted_at"
#   t.boolean  "av_touch_pad"
#   t.boolean  "av_microphone"
#   t.boolean  "av_projector"
#   t.boolean  "av_internet"
#   t.boolean  "av_teleconference"
#   t.boolean  "service_technician"
#   t.boolean  "service_cleaners"
#   t.boolean  "service_loading_dock"
#   t.boolean  "service_freight"
#   t.boolean  "service_insurance"
#   t.float    "duration",                 :default => 0.0
#   t.integer  "layout_id"
#   t.string   "event_type"
#   t.integer  "features"
#   t.integer  "approved_by_user_id"
#   t.boolean  "notify_guests"
#   t.datetime "event_approved_at"
#   t.string   "request_service_ids"
#   t.text     "external_emails"
#   t.boolean  "employee",                 :default => false
#   t.string   "rrule_data"
#   t.boolean  "created_by_pending_event"
#   t.integer  "cancelled_by_user_id"
#   t.text     "internal_instructions"
#   t.boolean  "scheduled_by_api"
#   t.integer  "authorizer_id"
#   t.boolean  "walkin"
#   t.string   "ics_uid"
#   t.integer  "event_type_2",             :default => 0
#   t.integer  "visitor_type_id"
#   t.string   "location_name"
#   t.string   "resource_id"
#   t.integer  "door_sign_id"
# end

# add_index "events", ["deleted_at"], :name => "index_events_on_deleted_at"
# add_index "events", ["group_id"], :name => "index_events_on_group_id"
# add_index "events", ["location_id"], :name => "index_events_on_location_id"
