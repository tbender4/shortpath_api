# frozen_string_literal: true

# yeah
class Building < Locationable
  has_many :floors, foreign_key: :parent_id, dependent: :destroy
  has_one :address, as: :addressable

  before_save { build_address unless address }

  # TODO: More optimal SQL queries for traversing through locationable tree
  def spaces
    floors.flat_map(&:spaces)
  end

  def leases
    spaces.flat_map(&:leases)
  end

  def active_leases
    spaces.flat_map(&:active_leases)
  end
end
