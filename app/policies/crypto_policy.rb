class CryptoPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def destroy?
    @user.admin?
  end

  def update?
    user.admin?
  end

  def create?
    user.admin?
  end

  def edit?
    update?
  end



end
