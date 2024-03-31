class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true, null: false
      t.string :street1
      t.string :string2
      t.string :city
      t.string :province
      t.string :zip
      t.string :time_zone # Are we defaulting something?

      t.timestamps
    end
  end
end


# create_table "addresses", :force => true do |t|
#   t.string   "addressable_type"
#   t.integer  "addressable_id"
#   t.string   "street1"
#   t.string   "street2"
#   t.string   "city"
#   t.string   "province"
#   t.string   "zip"
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.decimal  "lat",              :precision => 16, :scale => 12
#   t.decimal  "lng",              :precision => 16, :scale => 12
#   t.boolean  "geocoded",                                         :default => false
#   t.string   "county"
#   t.string   "cross_street"
#   t.string   "street3"
#   t.string   "attn"
#   t.string   "name"
#   t.string   "phone"
#   t.string   "email"
#   t.string   "time_zone"
#   t.string   "country"
#   t.string   "parking"
#   t.string   "country_code",                                     :default => "1"
# end

# add_index "addresses", ["addressable_id", "addressable_type"], :name => "index_addresses_on_addressable_id_and_addressable_type"
# add_index "addresses", ["lat"], :name => "index_addresses_on_lat"
# add_index "addresses", ["lng"], :name => "index_addresses_on_lng"
