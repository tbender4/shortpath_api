class AddUuidIndexToContact < ActiveRecord::Migration[7.1]
  def change
    add_index :contacts, :uuid
  end
end
