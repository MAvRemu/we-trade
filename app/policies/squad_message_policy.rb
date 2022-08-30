class SquadMessagePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      sqs = user.squads
      user.admin? ? scope.all : scope.where(sqs.include?(:chatroom.squad))
    end

    def create?
      (record.chatroom.users).include?(user)
    end
  end
end
