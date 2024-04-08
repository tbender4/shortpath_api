# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_08_030314) do
  create_table "addresses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "addressable_type", null: false
    t.bigint "addressable_id", null: false
    t.string "street1"
    t.string "string2"
    t.string "city"
    t.string "province"
    t.string "zip"
    t.string "time_zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
  end

  create_table "building_accounts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "building_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_building_accounts_on_building_id"
  end

  create_table "contacts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "company"
    t.string "title"
    t.string "email"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "primary_group_id"
    t.bigint "visitor_type_id"
    t.index ["primary_group_id"], name: "index_contacts_on_primary_group_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
    t.index ["uuid"], name: "index_contacts_on_uuid"
    t.index ["visitor_type_id"], name: "index_contacts_on_visitor_type_id"
  end

  create_table "event_guests", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "contact_id", null: false
    t.string "barcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_event_guests_on_contact_id"
    t.index ["event_id"], name: "index_event_guests_on_event_id"
  end

  create_table "event_occurrences", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_occurrences_on_event_id"
  end

  create_table "event_organizers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_organizers_on_event_id"
    t.index ["user_id"], name: "index_event_organizers_on_user_id"
  end

  create_table "events", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "subject"
    t.string "description"
    t.bigint "group_id", null: false
    t.bigint "locationable_id", null: false
    t.string "special_instructions"
    t.string "rrule_data"
    t.string "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_events_on_group_id"
    t.index ["locationable_id"], name: "index_events_on_locationable_id"
  end

  create_table "group_contacts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "contact_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_group_contacts_on_contact_id"
    t.index ["group_id"], name: "index_group_contacts_on_group_id"
  end

  create_table "groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leases", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state", null: false
    t.bigint "group_id", null: false
    t.bigint "locationable_id", null: false
    t.index ["group_id"], name: "index_leases_on_group_id"
    t.index ["locationable_id"], name: "index_leases_on_locationable_id"
  end

  create_table "locationables", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.string "code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.integer "parent_id"
    t.decimal "flevel", precision: 10
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "visitor_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "building_id", null: false
    t.string "name"
    t.string "category"
    t.boolean "hide_barcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_visitor_types_on_building_id"
  end

  create_table "visits", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "event_occurrence_id", null: false
    t.bigint "contact_id", null: false
    t.datetime "checked_in_at"
    t.datetime "checked_out_at"
    t.bigint "checked_in_by_user_id"
    t.bigint "checked_out_by_user_id"
    t.string "state"
    t.string "barcode"
    t.text "notes"
    t.bigint "barcode_disabled_by_user_id"
    t.datetime "barcode_disabled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barcode_disabled_by_user_id"], name: "index_visits_on_barcode_disabled_by_user_id"
    t.index ["checked_in_by_user_id"], name: "index_visits_on_checked_in_by_user_id"
    t.index ["checked_out_by_user_id"], name: "index_visits_on_checked_out_by_user_id"
    t.index ["contact_id"], name: "index_visits_on_contact_id"
    t.index ["event_occurrence_id"], name: "index_visits_on_event_occurrence_id"
  end

  add_foreign_key "building_accounts", "locationables", column: "building_id"
  add_foreign_key "contacts", "groups", column: "primary_group_id"
  add_foreign_key "contacts", "users"
  add_foreign_key "event_guests", "contacts"
  add_foreign_key "event_guests", "events"
  add_foreign_key "event_occurrences", "events"
  add_foreign_key "event_organizers", "events"
  add_foreign_key "event_organizers", "users"
  add_foreign_key "events", "groups"
  add_foreign_key "events", "locationables"
  add_foreign_key "group_contacts", "contacts"
  add_foreign_key "group_contacts", "groups"
  add_foreign_key "leases", "groups"
  add_foreign_key "leases", "locationables"
  add_foreign_key "visitor_types", "locationables", column: "building_id"
  add_foreign_key "visits", "contacts"
  add_foreign_key "visits", "event_occurrences"
  add_foreign_key "visits", "users", column: "barcode_disabled_by_user_id"
  add_foreign_key "visits", "users", column: "checked_in_by_user_id"
  add_foreign_key "visits", "users", column: "checked_out_by_user_id"
end
