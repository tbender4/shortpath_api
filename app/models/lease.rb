# frozen_string_literal: true

#  Join between a group and the space. Leases will determine what spaces a group can schedule to.
class Lease < ApplicationRecord
  belongs_to :group
  belongs_to :space, foreign_key: :locationable_id

  before_create { self.start_date ||= DateTime.now }
  validates :group, :space, :start_date, presence: true

  state_machine initial: :active do
    event :retire do
      transition active: :expired
    end
  end
end
