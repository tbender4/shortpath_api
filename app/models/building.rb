# frozen_string_literal: true

# yeah
class Building < Locationable
  has_many :floors, foreign_key: :parent_id, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  has_one :building_account, dependent: :destroy
  has_many :visitor_types # intentionally not destroying so it won't break visitor query
  accepts_nested_attributes_for :address, :building_account
  resourcify

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

  # Create required child objects upon save.
  def create_child_objects
    self.address ||= Address.create(addressable: self)
    self.building_account ||= BuildingAccount.create(building: self)
    return if visitor_types.present?

    visitor_types << VisitorType.new(building: self, name: 'Visitor')
  end
end
