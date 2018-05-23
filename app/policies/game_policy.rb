class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.sort
    end
  end

  def show?
    true
  end


end
