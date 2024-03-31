class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :company
      t.string :title
      t.string :email
      t.string :uuid # For user, not for guests

      t.timestamps
    end
  end
end

# create_table "contacts", :force => true do |t|
#   t.integer  "user_id"
#   t.string   "nickname"
#   t.string   "first_name"
#   t.string   "middle_name"
#   t.string   "last_name"
#   t.string   "company"
#   t.string   "title"
#   t.string   "phone_number"
#   t.string   "phone_extension"
#   t.integer  "avatar_id"
#   t.datetime "deleted_at"
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.integer  "primary_group_id"
#   t.integer  "primary_building_id"
#   t.string   "email"
#   t.string   "linkedin_url"
#   t.string   "prefix"
#   t.string   "checksum"
#   t.string   "fax"
#   t.string   "home_phone"
#   t.string   "mobile_phone"
#   t.string   "uuid"
#   t.string   "dln"
#   t.boolean  "citizen"
#   t.integer  "notifications",               :default => 1
#   t.string   "country_code"
#   t.string   "employee_code"
#   t.date     "dob"
#   t.string   "registration_status"
#   t.integer  "visitor_type_id"
#   t.datetime "nda_signed_at"
#   t.string   "personnel_id"
#   t.string   "badge_id"
#   t.text     "scheduled_by_ids"
#   t.datetime "badge_expires_at"
#   t.datetime "hired_at"
#   t.integer  "sponsor_id"
#   t.integer  "user_photo_id"
#   t.string   "business_unit"
#   t.boolean  "restricted_access"
#   t.boolean  "restricted_access_requested"
#   t.boolean  "restricted_access_approved"
#   t.integer  "new_joiner_host_id"
#   t.datetime "verify_at"
#   t.string   "deviceUUID"
# end
