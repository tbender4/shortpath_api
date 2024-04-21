# frozen_string_literal: true

# Main membership for a user. Drives the event management.
class Group < ApplicationRecord
  has_many :leases
  has_many :active_leases, -> { where state: 'active' }, class_name: 'Lease'
  has_many :schedulable_spaces, -> { distinct.includes(floor: :building) }, through: :active_leases, source: :space
  has_many :buildings_with_active_lease, -> { distinct }, through: :active_leases, source: :building

  has_many :group_contacts
  has_many :contacts, through: :group_contacts

  resourcify # Rolify gem

  def schedulable_spaces_grouped_by_building
    schedulable_spaces.includes(:building).group_by(&:building)
  end
end
