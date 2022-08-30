class SquadMessagePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      sqs = user.squads
      user.admin? ? scope.all : scope.where(sqs.include?(:chatroom.squad))
    end
  end

  def create?
    true
  end

end
