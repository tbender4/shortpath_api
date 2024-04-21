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
      def self.generate_is_x_of_what(role_name, source_type)
        has_many "is_#{role_name}_of_what".to_sym, lambda {
          where(roles: { name: role_name })
        }, through: :roles, source: :resource, source_type:
      end

      # Building role associations
      generate_is_x_of_what(:building_admin, 'Building')
      generate_is_x_of_what(:building_guard, 'Building')

      # Group role associations
      generate_is_x_of_what(:member, 'Group')
      generate_is_x_of_what(:admin, 'Group')
      generate_is_x_of_what(:schedule_visitors, 'Group')
    end
  end
  scopify
end
