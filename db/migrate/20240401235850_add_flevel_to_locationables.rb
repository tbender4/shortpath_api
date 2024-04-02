class AddFlevelToLocationables < ActiveRecord::Migration[7.1]
  def change
    add_column :locationables, :flevel, :decimal
  end
end
