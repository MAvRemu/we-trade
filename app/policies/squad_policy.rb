class SquadPolicy < ApplicationPolicy

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    user
  end

  def show?
    record.users.include?(user)
  end

  def destroy?
    record.user == user
  end

  def update?
    record.user == user
  end

  def edit?
    update?
  end

  def new?
    true
  end

  def join?
    true
  end

  def addToWatchlist?
    true
  end
end
