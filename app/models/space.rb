# frozen_string_literal: true

# Final, proper location for events to schedule visitors to.
class Space < Locationable
  belongs_to :floor, foreign_key: :parent_id
  has_many :leases, foreign_key: :locationable_id
  has_many :active_leases, -> { where state: 'active' }, class_name: 'Lease', foreign_key: :locationable_id
  has_one :building, through: :floor
end
