# frozen_string_literal: true

# yeah
class Building < Locationable
  has_many :floors, foreign_key: :parent_id, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  has_one :building_account, dependent: :destroy
  has_many :visitor_types, dependent: :destroy_async
  accepts_nested_attributes_for :address, :building_account, :floors
  resourcify

  after_save :create_child_objects
  has_many :spaces, through: :floors

  def leases
    Lease.joins('INNER JOIN locationables AS spaces ON spaces.id = leases.locationable_id')
         .joins('INNER JOIN locationables AS floors ON floors.id = spaces.parent_id')
         .where("spaces.type = 'Space' AND floors.parent_id = ?", id)
  end

  def active_leases
    leases.where(state: 'active')
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
