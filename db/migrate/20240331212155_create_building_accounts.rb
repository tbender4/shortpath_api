class CreateBuildingAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :building_accounts do |t|
      t.references :building, null: false, foreign_key: { to_table: :locationables }

      t.timestamps
    end
  end
end
