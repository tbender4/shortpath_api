# frozen_string_literal: true

# NOTE: The role names are to maintain compatibility
# Building Roles: building_admin, building_guard
# Group Roles: member, admin, schedule_visitors
# Big boy: superuser
class Role < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :users_roles

  belongs_to :resource,
             polymorphic: true,
             optional: true

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  validates_uniqueness_of :name, allow_blank: false

  scopify
end
