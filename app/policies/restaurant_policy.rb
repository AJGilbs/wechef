class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def update?
    user.id == record.id
  end

  def index
    true
  end

  def show
    true
  end

end
