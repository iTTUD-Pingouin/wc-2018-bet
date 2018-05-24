class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.sort
    end
  end

  def show?
    true
  end

  def create?
    user_is_admin?
  end

  def update?
    user_is_admin?
  end

  def destroy?
    user_is_admin?
  end

  def my_group?
    true
  end

  def global_ranking?
    true
  end


  private

  def user_is_admin?
    true
  end


end
