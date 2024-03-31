class CreateEventGuests < ActiveRecord::Migration[7.1]
  def change
    create_table :event_guests do |t|
      t.references :event, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true
      t.string :barcode

      t.timestamps
    end
  end
end

# create_table "event_guests", :force => true do |t|
#   t.integer  "event_id"
#   t.integer  "contact_id"
#   t.integer  "created_by_user_id"
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.string   "barcode"
#   t.string   "apple_wallet_file_name"
#   t.string   "apple_wallet_content_type"
#   t.integer  "apple_wallet_file_size"
#   t.datetime "apple_wallet_updated_at"
#   t.string   "nda_file_name"
#   t.string   "nda_file_size"
#   t.string   "nda_content_type"
#   t.datetime "nda_updated_at"
#   t.datetime "nda_signed_at"
#   t.integer  "nda_template_id"
#   t.string   "slug"
#   t.string   "attend"
#   t.string   "state"
#   t.integer  "approved_by_user_id"
#   t.integer  "denied_by_user_id"
#   t.text     "google_pay_token"
# end

# add_index "event_guests", ["contact_id"], :name => "index_event_guests_on_contact_id"
# add_index "event_guests", ["event_id"], :name => "index_event_guests_on_event_id"
# add_index "event_guests", ["slug"], :name => "index_event_guests_on_slug"
