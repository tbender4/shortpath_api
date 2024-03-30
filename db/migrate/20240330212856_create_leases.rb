class CreateLeases < ActiveRecord::Migration[7.1]
  def change
    create_table :leases do |t|
      t.date :start_date
      t.date :end_date
      #   t.integer  "locationable_id"
      #   t.integer  "building_id"
      #   t.integer  "group_id"
      #   t.string   "state"
      t.timestamps
    end
  end
end


# Foreign IDs I want to keep:
#   t.integer  "updated_by_user_id"
#   t.integer  "created_by_user_id"

# create_table "leases", :force => true do |t|
#   t.integer  "created_by_user_id"
#   t.integer  "updated_by_user_id"
#   t.string   "code"
#   t.string   "type"
#   t.string   "state"
#   t.date     "start_date"
#   t.date     "end_date"
#   t.integer  "version"
#   t.integer  "locationable_id"
#   t.integer  "building_id"
#   t.datetime "deleted_at"
#   t.integer  "group_id"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end

# add_index "leases", ["building_id"], :name => "index_leases_on_building_id"
# add_index "leases", ["deleted_at"], :name => "index_leases_on_deleted_at"
# add_index "leases", ["group_id"], :name => "index_leases_on_group_id"
# add_index "leases", ["locationable_id"], :name => "index_leases_on_locationable_id"
# add_index "leases", ["state"], :name => "index_leases_on_state"
