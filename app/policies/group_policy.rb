# frozen_string_literal: true

# Refer to the scope for limiting their visibility
class GroupPolicy < ApplicationPolicy
  def show?
    return true if @user.has_role?(Role::GROUP_MEMBER, @record) || qualifying_building_admin?

    super
  end

  # Only superuser can create a new group from scratch. Building admins however can create a group when creating
  # a lease. Anyone can view what groups they're part of. It'll return nil if needed

  # Must be group admin or qualifying building admin
  def update?
    return true if @user.has_role?(Role::GROUP_ADMIN, @record) || qualifying_building_admin?

    super
  end

  def destroy?
    update?
  end

  def qualifying_building_admin?
    Building.find_roles('building_admin', @user).where(resource_id: @record.buildings_with_active_lease).exists?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
