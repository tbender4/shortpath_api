# frozen_string_literal: true

# Building Admin scoped down to where they're group admins of otherwise it will not work.
class BuildingPolicy < ApplicationPolicy
  def index?
    return true if @user.has_role? :building_admin, :any

    super
  end

  def show?
    return true if @user.has_role?(:building_admin, @record)

    super
  end

  def update?
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
