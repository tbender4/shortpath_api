class AddAttributesToContact < ActiveRecord::Migration[7.1]
  def change
    add_reference :contacts, :group, foreign_key: true
    add_reference :contacts, :visitor_type, foreign_key: true
  end
end
