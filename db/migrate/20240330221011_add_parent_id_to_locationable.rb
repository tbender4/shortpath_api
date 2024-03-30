class AddParentIdToLocationable < ActiveRecord::Migration[7.1]
  def change
    add_column :locationables, :parent_id, :integer
  end
end
