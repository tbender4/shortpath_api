class CreateVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :visits do |t|
      t.references :event_occurrence, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true
      t.datetime :checked_in_at
      t.datetime :checked_out_at
      t.references :checked_in_by_user, foreign_key: { to_table: :users }
      t.references :checked_out_by_user, foreign_key: { to_table: :users }
      t.string :state
      t.string :barcode
      t.text :notes
      t.references :barcode_disabled_by_user, foreign_key: { to_table: :users }
      t.datetime :barcode_disabled_at

      t.timestamps
    end
  end
end
