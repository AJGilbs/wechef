class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def create?
      true
    end

    def update?
      true if current_restaurent
    end
  end

  def index
    true
  end

  def show
    true
  end

end
