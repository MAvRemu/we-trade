class MembershipPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.admin? ? scope.all : scope.where(user: record.user)
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def destroy?
    record.user == user || user.admin?
  end

end
