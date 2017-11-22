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
end
