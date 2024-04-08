# frozen_string_literal: true

# Building Admin can go through the page
class BuildingPolicy < ApplicationPolicy
  def index?
    return true if @user.has_role? :building_admin, :any

    super
  end

  def show?
    return true if @user.has_role?(:building_admin, @building)

    super
  end

  def update?
    show?
  end

  def destroy?
    show?
  end

  # Building admins can only see their buildings.
  class Scope < ApplicationPolicy::Scope
    def resolve
      return scope.all if user.has_role? :superuser

      user.is_building_admin_of_what
    end
  end
end
