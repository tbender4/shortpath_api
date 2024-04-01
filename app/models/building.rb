# frozen_string_literal: true

# yeah
class Building < Locationable
  has_many :floors, foreign_key: :parent_id, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  has_one :building_account, dependent: :destroy
  accepts_nested_attributes_for :address, :building_account

  after_save :create_child_objects
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

  private

  def create_child_objects
    address ||= Address.create(addressable: self)
    building_account ||= BuildingAccount.create(building: self)
  end

end
