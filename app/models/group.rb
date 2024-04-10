# frozen_string_literal: true

# Main membership for a user. Drives the event management.
class Group < ApplicationRecord
  has_many :leases
  has_many :active_leases, -> { where state: 'active' }, class_name: 'Lease'
  has_many :schedulable_spaces, through: :active_leases, source: :space

  has_many :group_contacts
  has_many :contacts, through: :group_contacts

  resourcify # Rolify gem
end
