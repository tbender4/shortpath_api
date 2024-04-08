class RemoveVisitorTypesForeignConstraintFromContacts < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :contacts, column: :visitor_type_id
  end
end
