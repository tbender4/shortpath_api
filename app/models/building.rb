# frozen_string_literal: true

# Building -> Floors -> Spaces. Space + Group = Lease
class Building < Locationable
  has_many :floors, foreign_key: :parent_id, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  has_one :building_account, dependent: :destroy
  has_many :visitor_types, dependent: :destroy_async
  has_many :spaces, through: :floors
  has_many :leases, through: :spaces
  has_many :active_leases, through: :spaces

  accepts_nested_attributes_for :address, :building_account, :floors
  resourcify

  after_save :create_child_objects

  private

  # Create required child objects upon save.
  def create_child_objects
    self.address ||= Address.create(addressable: self)
    self.building_account ||= BuildingAccount.create(building: self)
    return if visitor_types.present?

    visitor_types << VisitorType.new(building: self, name: 'Visitor')
  end
end
