class MakeUserReferencesInEventsOptional < ActiveRecord::Migration[7.1]
  def change
    change_column_null :events, :created_by_user_id, true
    change_column_null :events, :updated_by_user_id, true
  end
end
