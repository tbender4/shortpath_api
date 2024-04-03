class RenameGroupIdToPrimaryGroupIdInContacts < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :contacts, :groups
    rename_column :contacts, :group_id, :primary_group_id
    add_foreign_key :contacts, :groups, column: :primary_group_id
  end
end
