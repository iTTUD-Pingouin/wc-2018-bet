require 'date'


class BetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true && (record.game.hour>Time.now.hour ||  record.game.date != Date.today.day) && record.game.date>= Date.today.day
  end

  def update?
    record.user == user && (record.game.hour>Time.now.hour ||  record.game.date != Date.today.day) && record.game.date >= Date.today.day
  end

  def destroy?
    record.user == user && (record.game.hour>Time.now.hour ||  record.game.date != Date.today.day) && record.game.date>= Date.today.day
  end
end
