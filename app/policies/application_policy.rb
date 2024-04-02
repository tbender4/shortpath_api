# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.has_role? :superuser
  end

  def show?
    # false
    @user.has_role? :superuser
  end

  def create?
    # false
    @user.has_role? :superuser
  end

  def new?
    create?
  end

  def update?
    # false
    @user.has_role? :superuser
  end

  def edit?
    update?
  end

  def destroy?
    # false
    @user.has_role? :superuser
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
