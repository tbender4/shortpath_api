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

ActiveRecord::Schema[7.1].define(version: 2024_03_31_194046) do
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
    t.index ["uuid"], name: "index_contacts_on_uuid"
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
  end

  add_foreign_key "event_guests", "contacts"
  add_foreign_key "event_guests", "events"
  add_foreign_key "events", "groups"
  add_foreign_key "events", "locationables"
  add_foreign_key "group_contacts", "contacts"
  add_foreign_key "group_contacts", "groups"
  add_foreign_key "leases", "groups"
  add_foreign_key "leases", "locationables"
end
