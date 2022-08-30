class PagePolicy < ApplicationPolicy
  skip_before_action :authenticate_user!, only: :home

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def home?
    true
  end
end
