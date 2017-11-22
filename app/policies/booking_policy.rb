class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

    def create?

    true
    # if current_restaurant
    end

    def show?
      true
    end
end
