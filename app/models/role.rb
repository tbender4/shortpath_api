# frozen_string_literal: true

# NOTE: The role names are to maintain compatibility
# Building Roles: building_admin, building_guard
# Group Roles: member, admin, schedule_visitors
# Big boy: superuser
class Role < ApplicationRecord
  GROUP_MEMBER = 'member'
  GROUP_ADMIN = 'admin'
  SCHEDULE_VISITORS = 'schedule_visitors'

  BUILDING_ADMIN = 'building_admin'
  BUILDING_GUARD = 'building_guard'

  SUPERUSER = 'superuser'

  has_and_belongs_to_many :users, join_table: :users_roles

  belongs_to :resource,
             polymorphic: true,
             optional: true

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  validates_uniqueness_of :name, allow_blank: false

  # User role query helpers
  module QueryHelper
    extend ActiveSupport::Concern

    included do
      # Roles helpers
      has_many :is_building_admin_of_what, lambda {
        where(roles: { name: :building_admin })
      }, through: :roles, source: :resource, source_type: :Building

      has_many :is_building_guard_of_what, lambda {
                                             where(roles: { name: :building_guard })
                                           }, through: :roles, source: :resource, source_type: :Building

      has_many :is_member_of_what, lambda {
                                     where(roles: { name: :member })
                                   }, through: :roles, source: :resource, source_type: :Group

      has_many :is_admin_of_what, lambda {
                                    where(roles: { name: :admin })
                                  }, through: :roles, source: :resource, source_type: :Group

      has_many :can_schedule_visitors_for_what, lambda {
        where(roles: { name: :schedule_visitors })
      }, through: :roles, source: :resource, source_type: :Group
    end
  end
  scopify
end
