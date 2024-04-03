class CreateVisitorTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :visitor_types do |t|
      t.references :building, null: false, foreign_key: { to_table: :locationables }
      t.string :name
      t.string :category
      t.boolean :hide_barcode

      t.timestamps
    end
  end
end
