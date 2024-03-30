class Lease < ApplicationRecord
  belongs_to :group
  belongs_to :space, foreign_key: :locationable_id

  state_machine :initial => :active do
    event :retire do
      transition :active => :expired
    end
  end
end
