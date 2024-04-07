class CreateEventOccurrences < ActiveRecord::Migration[7.1]
  def change
    create_table :event_occurrences do |t|
      t.references :event, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
