class DisallowNullInLeasesStateColumn < ActiveRecord::Migration[7.1]
  def change
    change_column_null :leases, :state, false
  end
end
