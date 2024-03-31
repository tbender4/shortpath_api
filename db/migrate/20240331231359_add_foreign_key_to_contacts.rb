class AddForeignKeyToContacts < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :contacts, :users, validate: false
  end
end
