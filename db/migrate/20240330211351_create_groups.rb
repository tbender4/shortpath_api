class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.string :uuid

      t.timestamps
    end
  end
end

# Foreign IDs I want to keep:
#   t.integer  "primary_contact_id"
#   t.integer  "updated_by_user_id"
#   t.integer  "created_by_user_id"

## Also handle flag_shih_tzu

# create_table "groups", :force => true do |t|
#   t.string   "name"
#   t.text     "description"
#   t.string   "hostname"
#   t.string   "type"
#   t.integer  "primary_contact_id"
#   t.integer  "join",                      :default => 1
#   t.datetime "deleted_at"
#   t.integer  "updated_by_user_id"
#   t.integer  "created_by_user_id"
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.integer  "version",                   :default => 1
#   t.integer  "primary_address_id"
#   t.integer  "billing_address_id"
#   t.boolean  "admin_approve",             :default => false
#   t.integer  "features"
#   t.string   "uuid"
#   t.string   "email_domain"
#   t.integer  "division_id"
#   t.time     "email_invitation_time"
#   t.integer  "default_location_id"
#   t.boolean  "group_badge_active",        :default => false
#   t.integer  "group_badge_active_before"
#   t.integer  "group_badge_expire_after"
#   t.integer  "max_visitor_number"
# end
