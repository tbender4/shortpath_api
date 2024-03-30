class CreateLocationables < ActiveRecord::Migration[7.1]
  def change
    create_table :locationables do |t|
      t.string :name
      t.text :notes
      t.string :code
      t.text :description

      t.timestamps
    end
  end
end

# type: Building, Floor, Space
# state: State Machine
#
# Building Specific:
#   t.string :barcode_service
#   t.text     "host_to_visitor_email_wording"  # Need to research
#   t.text     "visitor_to_host_email_wording"  # Need to research
#
# Floor Specific:
#   t.decimal :flevel
#
#
# Access Control?
#   t.integer  "access_group"
#

# create_table "locationables", :force => true do |t|
#   t.string   "name"
#   t.string   "type"
#   t.integer  "parent_id"
#   t.integer  "column"
#   t.text     "notes"
#   t.integer  "size"
#   t.integer  "position"
#   t.datetime "deleted_at"
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.string   "code"
#   t.text     "description"
#   t.string   "state"
#   t.integer  "address_id"
#   t.integer  "created_by_user_id"
#   t.integer  "updated_by_user_id"
#   t.integer  "version",                                                         :default => 1
#   t.decimal  "flevel",                            :precision => 4, :scale => 2, :default => 0.0
#   t.integer  "lft"
#   t.integer  "rgt"
#   t.boolean  "shared",                                                          :default => false
#   t.string   "color"
#   t.boolean  "all_day"
#   t.string   "barcode_service"
#   t.integer  "max_days_in_advance"
#   t.boolean  "require_approval"
#   t.integer  "min_capacity"
#   t.integer  "max_capacity"
#   t.integer  "default_group_id"
#   t.boolean  "conference_room_feature"
#   t.integer  "master_location_id"
#   t.float    "schedule_gap_in_hours"
#   t.integer  "max_booking_weeks"
#   t.text     "host_to_visitor_email_wording"
#   t.text     "visitor_to_host_email_wording"
#   t.string   "non_building_record"
#   t.integer  "access_group"
#   t.boolean  "destination_dispatch"
#   t.text     "barcode_email_instruction_wording"
#   t.text     "detail_email_instruction_wording"
#   t.boolean  "hide",                                                            :default => false
#   t.string   "badge_logo_url"
# end

# add_index "locationables", ["deleted_at"], :name => "index_locationables_on_deleted_at"
# add_index "locationables", ["lft"], :name => "index_locationables_on_lft"
# add_index "locationables", ["rgt"], :name => "index_locationables_on_rgt"
# add_index "locationables", ["type"], :name => "index_locationables_on_type"
