class PostPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def myposts?
    true
  end

  def edit?
    record.user == user || user.admin?
  end

  def update?
    edit?
  end

  def new?
    true
  end

  def create?
    new?
  end

end
