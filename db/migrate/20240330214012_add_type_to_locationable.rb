class AddTypeToLocationable < ActiveRecord::Migration[7.1]
  def change
    add_column :locationables, :type, :string
  end
end
