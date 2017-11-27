class ChefPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def search?
    true
  end

  def edit?
    update?
  end

  def update?
    user.id == record.id
  end
end
