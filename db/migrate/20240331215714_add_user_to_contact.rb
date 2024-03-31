class AddUserToContact < ActiveRecord::Migration[7.1]
  def change
    add_reference :contacts, :user
  end
end
