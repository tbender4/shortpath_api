class AddCreatedByAndUpdateByToEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :created_by_user, foreign_key: { to_table: :users }
    add_reference :events, :updated_by_user, foreign_key: { to_table: :users }
  end
end
