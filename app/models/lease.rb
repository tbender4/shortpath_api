# frozen_string_literal: true

#  Join between a group and the space. Leases will determine what spaces a group can schedule to.
class Lease < ApplicationRecord
  belongs_to :group
  belongs_to :space, foreign_key: :locationable_id
  has_one :building, through: :space

  before_create { self.start_date ||= DateTime.now.beginning_of_day }
  before_save do
    return if expired? || !end_date

    l.state_event = 'retire' if end_date <= DateTime.now.beginning_of_day
  end

  validates :group, :space, :start_date, presence: true

  state_machine initial: :active do
    event :retire do
      transition active: :expired
    end
  end
end
