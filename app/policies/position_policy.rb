class PositionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.is_a?(Chef)
  end

  def edit?
    user.id == record.chef.id
  end

  def destroy?
    user == record.chef
  end
end
