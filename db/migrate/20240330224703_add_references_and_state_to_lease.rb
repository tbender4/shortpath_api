class AddReferencesAndStateToLease < ActiveRecord::Migration[7.1]
  def change
    add_column :leases, :state, :string
    add_reference :leases, :group, null: false, foreign_key: true
    add_reference :leases, :locationable, null: false, foreign_key: true
  end
end
